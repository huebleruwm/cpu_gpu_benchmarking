import sys
import random
import argparse

# --- Argument Parsing with -dims ---
parser = argparse.ArgumentParser()
parser.add_argument("-vars", type=int, help="Number of variables (≥ 2)")
parser.add_argument("-loops", type=int, help="Number of loops (≥ 1)")
parser.add_argument("-ndims", type=str, help="number of dimensions")
args = parser.parse_args()

if args.vars < 2 or args.loops < 1:
    print("Error: <vars> must be ≥ 2 and <loops> must be ≥ 1.")
    sys.exit(1)

num_vars = args.vars
num_loops = args.loops

#dims = tuple(map(int, args.dims.split(",")))
ndims = int(args.ndims)
dim_vars = ['ni', 'nj', 'nk', 'nl', 'nm', 'nn'][:ndims]
dims_str = ", ".join(dim_vars)

def generate_explicit_loop(body, ndims):
    dim_letters = ['i', 'j', 'k', 'l', 'm', 'n']
    dim_vars = ['ni', 'nj', 'nk', 'nl', 'nm', 'nn'][:ndims]
    active_dims = dim_letters[:ndims]

    acc_directive = [f"!$acc parallel loop collapse({ndims}) default(present) async(1)"]
    loop_open = [f"  do {idx} = 1, {bound}" for idx, bound in zip(reversed(active_dims), reversed(dim_vars))]
    loop_body = "  " * (ndims) + body
    loop_close = [f"  end do" for _ in active_dims[::-1]]
    return "\n".join(acc_directive + loop_open + [loop_body] + loop_close)

def format_acc_data_directive(var_list, line_limit=100):
    prefix = "!$acc "
    base = "data copyin("
    suffix = ") copyout(final_result)"
    lines = []
    current_line = base

    for i, var in enumerate(var_list):
        entry = f"{var}, "
        next_line = current_line + entry
        full_line = prefix + next_line + (suffix if i == len(var_list) - 1 else "&")

        if len(full_line) > line_limit:
            # Finalize current line with &
            lines.append(prefix + current_line.rstrip(", ") + ", &")
            current_line = entry  # Start next line fresh (just vars)
        else:
            current_line = next_line

    # Final line (no trailing &)
    lines.append(prefix + current_line.rstrip(", ") + suffix)
    return "\n".join("  " + line for line in lines)

# --- Fortran Declarations ---
decls = ""
random_init = ""
for i in range(1, num_vars + 1):
    decls += f"  real(dp), allocatable, dimension(:{',:' * (ndims - 1)}) :: var{i}\n"
    random_init += f"  allocate(var{i}({dims_str}))\n"
    random_init += f"  call random_number(var{i})\n"

decls += f"  real(dp), allocatable, dimension(:{',:' * (ndims - 1)}) :: final_result\n"
random_init += f"  allocate(final_result({dims_str}))\n"
random_init += "  final_result = 0.0_dp\n"

# --- Generate Computation Loops ---
loop_vars = ['i', 'j', 'k', 'l', 'm', 'n']
used_loop_vars = loop_vars[:ndims]
decls_loop_vars = f"  integer :: {', '.join(used_loop_vars + ['iter'])}\n"

# Build copyin list: all var#
var_list = [f"var{i}" for i in range(1, num_vars + 1)]
acc_start = format_acc_data_directive(var_list) + "\n"
acc_end = "  !$acc end data\n"

loop_code = acc_start
loop_code += "  call system_clock(clock_start, clock_rate)\n\n"
loop_code += "  do iter = 1, iterations\n"
for i in range(1, args.loops + 1):
    var_a = random.randint(1, args.vars)
    var_b = random.randint(1, args.vars)
    loop_code += f"  ! Loop {i}: final_result += var{var_a} * var{var_b}\n"
    index_str = ", ".join(used_loop_vars)
    # Choose random count of vars (1–10) and build expression
    count = random.randint(1, min(10, args.vars))
    chosen = [random.randint(1, args.vars) for _ in range(count)]
    ops = ['+', '-', '*', '/']
    expr_parts = []
    for v in chosen:
        expr_parts.append(f"var{v}({index_str})")
    expr = expr_parts[0]
    for part in expr_parts[1:]:
        op = random.choice(ops)
        expr = f"({expr} {op} {part})"
    body = f"final_result({index_str}) = final_result({index_str}) + {expr}"
    loop_code += generate_explicit_loop(body, ndims) + "\n"

# --- Compute and Print Average ---
loop_code += "  end do\n"
loop_code += "\n  call system_clock(clock_end)\n"
loop_code += "  elapsed_time = real(clock_end - clock_start, dp) / real(clock_rate, dp)\n"
loop_code += "  print *, 'Loop execution time (s):', elapsed_time\n"
loop_code += acc_end
loop_code += "\n  ! Compute and print average\n"
loop_code += "  print *, 'Average of final_result =', sum(final_result) / size(final_result)\n"

namelist_vars = dim_vars + ["iterations"]
namelist_block = f"  integer :: {', '.join(namelist_vars)}\n"
namelist_block += f"  namelist /dims/ {', '.join(namelist_vars)}\n"
namelist_block += f"  open(unit=10, file='dims.nml')\n"
namelist_block += f"  read(10, nml=dims)\n"

timer_vars = (
    "  integer :: clock_start, clock_end, clock_rate\n"
    "  real(dp) :: elapsed_time\n"
)

# --- Final Fortran Code ---
fortran_code = f"""
program add_arrays
  implicit none
  integer, parameter :: dp = kind(1.0d0)
{decls_loop_vars.strip()}
{timer_vars.strip()}
{decls.strip()}
{namelist_block.strip()}

  ! Allocate and initialize variables
{random_init.strip()}

{loop_code.strip()}

end program add_arrays
"""

# --- Write to File ---
with open("main.F90", "w") as f:
    f.write(fortran_code.strip())

print(f"main.F90 has been created with {num_vars} variables and {num_loops} loops.")

# --- Write namelist file ---
# with open("dims.nml", "w") as f:
#     f.write("&dims\n")
#     for name, val in zip(dim_vars, dims):
#         f.write(f"  {name} = {val},\n")
#     f.write("  iterations = 1,\n")  # Default value; change as needed
#     f.write("/\n")

# print("dims.nml has been created with dimensions:", dict(zip(dim_vars, dims)))