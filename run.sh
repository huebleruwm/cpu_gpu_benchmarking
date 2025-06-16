#!/bin/bash
set -e

# Show usage if insufficient arguments
if [ $# -lt 2 ]; then
    echo "Usage: ./run.sh {intel|nvhpc_cpu|nvhpc_gpu} -dims ni,nj[,nk,...] [-iterations N] [-tasks N]"
    exit 1
fi

CONFIG=$1
shift

# Default values
NTASKS=1
ITERATIONS=1
DIMS_STRING=""

# Parse arguments
while [[ $# -gt 0 ]]; do
    case "$1" in
        -dims)
            shift
            DIMS_STRING="$1"
            ;;
        -iterations)
            shift
            ITERATIONS="$1"
            ;;
        -tasks)
            shift
            NTASKS="$1"
            ;;
        *)
            echo "Unknown argument: $1"
            exit 2
            ;;
    esac
    shift
done

# Validate required arguments
if [ -z "$DIMS_STRING" ]; then
    echo "Error: -dims must be specified"
    exit 3
fi

# Generate dims.nml
IFS=',' read -ra DIMS <<< "$DIMS_STRING"
DIM_NAMES=(ni nj nk nl nm nn)

echo "Generating dims.nml from: $DIMS_STRING"
echo "&dims" > dims.nml
for i in "${!DIMS[@]}"; do
    echo "  ${DIM_NAMES[i]} = ${DIMS[i]}," >> dims.nml
done
echo "  iterations = ${ITERATIONS}," >> dims.nml
echo "/" >> dims.nml

# Locate binary
BUILD_DIR="build_${CONFIG}"
BINARY="${BUILD_DIR}/hello"

if [ ! -x "$BINARY" ]; then
    echo "Error: Binary not found at '$BINARY'"
    echo "Make sure to run './build.sh $CONFIG' first."
    exit 4
fi

echo "Running $BINARY with ${NTASKS} MPI task(s), iterations=${ITERATIONS}, and dimensions: ${DIMS[*]}"
#mpirun -n "$NTASKS" "$BINARY"
mpirun --cpu-bind core --mem-bind local -np "$NTASKS" bash -c "cd $(pwd); set_gpu_rank $BINARY"
