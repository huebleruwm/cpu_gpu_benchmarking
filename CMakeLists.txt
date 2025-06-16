cmake_minimum_required(VERSION 3.15)
project(HelloFortran LANGUAGES Fortran)

include(ExternalProject)

# --- Download and build GPTL ---
ExternalProject_Add(gptl_ext
    PREFIX ${CMAKE_BINARY_DIR}/gptl
    URL https://github.com/jmrosinski/GPTL/releases/download/v8.1.1/gptl-8.1.1.tar.gz
    URL_HASH SHA256=b8ee26f7aeedd2a31d565789634e7c380023fe6b65bbf59030884f4dcbce94a5
    CONFIGURE_COMMAND ./configure FC=${CMAKE_Fortran_COMPILER} FCFLAGS=-fPIC CFLAGS=-fPIC --disable-mpi
    BUILD_COMMAND make
    INSTALL_COMMAND make install DESTDIR=${CMAKE_BINARY_DIR}/gptl_install
    BUILD_IN_SOURCE 1
)

# --- Paths to installed GPTL headers and library ---
set(GPTL_INSTALL_PREFIX ${CMAKE_BINARY_DIR}/gptl_install/usr/local)
set(GPTL_INCLUDE_DIR ${GPTL_INSTALL_PREFIX}/include)
set(GPTL_LIB_DIR ${GPTL_INSTALL_PREFIX}/lib)

# --- Tell the linker and compiler where to find GPTL ---
include_directories(
  ${GPTL_INCLUDE_DIR}
  ${CMAKE_BINARY_DIR}/gptl/src/gptl_ext/fortran/src  # for gptl.mod
)
link_directories(${GPTL_LIB_DIR})

# --- Define your executable ---
add_executable(hello main.F90)

# --- Make sure GPTL is built before the executable ---
add_dependencies(hello gptl_ext)

# --- Link against GPTL ---
target_link_libraries(hello PRIVATE gptl gptlf)
