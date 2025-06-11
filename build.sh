#!/bin/bash
set -e

if [ $# -ne 1 ]; then
    echo "Usage: ./build.sh {intel|nvhpc_cpu|nvhpc_gpu}"
    exit 1
fi

CONFIG=$1

case "$CONFIG" in
    intel)
        export FC=ifx
        FFLAGS="-O2"
        ;;
    nvhpc_cpu)
        export FC=nvfortran
        FFLAGS="-O2"
        ;;
    nvhpc_gpu)
        export FC=nvfortran
        LDFLAGS="-acc"
        FFLAGS="-acc -Minfo=accel"
        ;;
    *)
        echo "Unknown config: $CONFIG"
        exit 1
        ;;
esac

# Separate build dir per config
BUILD_DIR="build_$CONFIG"
mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

# Force reconfiguration with new compiler/flags
cmake -DCMAKE_Fortran_COMPILER=$FC -DCMAKE_Fortran_FLAGS="$FFLAGS" ..
make -j
