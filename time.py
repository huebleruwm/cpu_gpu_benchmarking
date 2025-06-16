import argparse
import subprocess
import csv
import os

# --- Argument Parsing ---
parser = argparse.ArgumentParser()
parser.add_argument("-dims", required=True, help="Comma-separated dimensions (e.g., 8,134)")
parser.add_argument("-iterations", type=int, default=1, help="Iterations for Fortran loop")
parser.add_argument("-config", required=True, choices=["nvhpc", "nvhpc_gpu", "intel"], help="Compiler config")
parser.add_argument("-nvars", type=int, required=True, help="Number of variables to generate")
parser.add_argument("-nloops", type=int, required=True, help="Number of computation loops to generate")
parser.add_argument("-ntasks", type=int, required=True, help="Number of tasks to use")
parser.add_argument("-name", type=str, required=True, help="Prefix for csv file")
args = parser.parse_args()

ntasks = args.ntasks
dims = list(map(int, args.dims.split(",")))
dim_string = ",".join(map(str, dims))
fixed_dims = dims[1:] if len(dims) > 1 else []
config = args.config
csv_filename = f"{args.name}_{config}_Dxb{'b'.join(map(str, dims[1:]))}_V{args.nvars}_L{args.nloops}_T{ntasks}.csv"

# --- Step 1: Generate Fortran Program ---
print(f">>> Generating Fortran source with {args.nvars} vars, {args.nloops} loops, dims={dim_string}")
subprocess.run(["python", "create_program.py", "-vars", str(args.nvars), "-loops", str(args.nloops), "-ndims", str(len(dims))], check=True)

# --- Step 2: Build Program ---
print(f">>> Building Fortran program with config: {config}")
subprocess.run(["./build.sh", config], check=True)

# --- Step 3: Sweep n1 and Run Timings ---
with open(csv_filename, mode="w", newline="") as f:
    writer = csv.writer(f)
    writer.writerow(
        ["config", "iterations", "ntasks", "ndims", "n1"]
        + [f"n{i+2}" for i in range(len(fixed_dims))]
        + ["loop_runtime_seconds"]
    )

n1 = 1
max_n1 = dims[0]

while n1 <= max_n1:
    full_dims = [n1] + fixed_dims
    dims_arg = ",".join(map(str, full_dims))

    print(f">>> Running: ./run.sh {config} -dims {dims_arg} -iterations {args.iterations} -tasks {ntasks}")
    try:
        result = subprocess.run(
            ["./run.sh", config, "-dims", dims_arg, "-iterations", str(args.iterations), "-tasks", str(ntasks)],
            check=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            text=True
        )

        runtime = None
        try:
            with open("timing.summary", "r") as timing_file:
                for line in timing_file:
                    if line.strip().startswith("main_loop"):
                        fields = line.split()
                        runtime = float(fields[5])  # wallmax
                        break
        except Exception as e:
            raise RuntimeError(f"Error reading timing.summary: {e}")

        if runtime is None:
            raise RuntimeError("Failed to extract 'main_loop' wallmax time from timing.summary")

        print(f"  -- Batch Size = {n1*ntasks} --- Runtime = {runtime:.6f} s --- Throughput = {n1*ntasks/runtime:.3f}")

        # Save to CSV
        print(f"Saving to {csv_filename}")
        with open(csv_filename, mode="a", newline="") as f:
            writer = csv.writer(f)
            writer.writerow(
                [config, args.iterations, ntasks, len(dims), n1] + fixed_dims + [runtime]
            )

    except subprocess.CalledProcessError as e:
        print("Run failed:\n", e.output)

    # Smart stepping
    if n1 < 32:
        n1 += 1
    elif n1 < 64:
        n1 += 4
    elif n1 < 128:
        n1 += 8
    elif n1 < 256:
        n1 += 16
    elif n1 < 512:
        n1 += 32
    elif n1 < 1024:
        n1 += 64
    else:
        n1 *= 2
