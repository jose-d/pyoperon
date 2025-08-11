#!/usr/bin/env bash

if [[ -n "${VIRTUAL_ENV}" ]]; then
    INSTALL_PREFIX="${VIRTUAL_ENV}"
elif [[ -n "${CONDA_PREFIX}" ]]; then
    INSTALL_PREFIX="${CONDA_PREFIX}"
else
    INSTALL_PREFIX=$(python -c "import sysconfig; print(sysconfig.get_config_var('prefix'))")
fi

if [[ -z "${INSTALL_PREFIX}" ]]; then
    echo "Error: could not determine install prefix."
    echo $INSTALL_PREFIX
    exit
fi

set -e

PLATFORM=linux

if [[ "$OSTYPE" == "darwin"* ]]; then
    PLATFORM=osx
fi

INSTALL_ARIA_CSV=1
INSTALL_EIGEN=1
INSTALL_EVE=1
INSTALL_FLUKY=1
INSTALL_VSTAT=1
INSTALL_FAST_FLOAT=1
INSTALL_PRATT_PARSER=1
INSTALL_UNORDERED_DENSE=1
INSTALL_CPPSORT=1
INSTALL_FMT=1
INSTALL_MICROSOFT_GSL=1
INSTALL_SPAN_LITE=1
INSTALL_BYTE_LITE=1
INSTALL_QUICKCPPLIB=1
INSTALL_STATUS_CODE=1
INSTALL_OUTCOME=1
INSTALL_LBFGS=1
INSTALL_TASKFLOW=1
INSTALL_MDSPAN=1
INSTALL_CPPTRACE=1
INSTALL_LIBASSERT=1
INSTALL_OPERON=1

# aria-csv
if [[ "${INSTALL_ARIA_CSV}" -ne 1 ]]; then
    echo "Skipping aria-csv installation."
else

    [ -d csv-parser ] && rm -rf csv-parser
    git clone https://github.com/AriaFallah/csv-parser csv-parser
    pushd csv-parser
    git checkout 4965c9f320d157c15bc1f5a6243de116a4caf101
    cmake -S . -B build \
        -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX}
    cmake --install build
    popd
    rm -rf csv-parser
fi

# eigen
if [[ "${INSTALL_EIGEN}" -ne 1 ]]; then
    echo "Skipping Eigen installation."
else    
    echo "Installing Eigen..."
    [ -d eigen ] && rm -rf eigen
    git clone https://gitlab.com/libeigen/eigen.git
    pushd eigen
    git checkout 3.4.0
    cmake -S . -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX}
    cmake --build build
    cmake --install build
    popd
    rm -rf eigen
fi

## eve
if [[ "${INSTALL_EVE}" -ne 1 ]]; then
    echo "Skipping EVE installation."
else
    echo "Installing EVE..."
    [ -d eve ] && rm -rf eve 
    git clone https://github.com/jfalcou/eve eve
    pushd eve
    git checkout 3d5821fe770a62c01328b78bb55880b39b8a0a26
    cmake -S . -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DEVE_BUILD_TEST=OFF \
        -DEVE_BUILD_BENCHMARKS=OFF \
        -DEVE_BUILD_DOCUMENTATION=OFF \
        -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX}
    cmake --install build
    popd
    rm -rf eve
fi

## fluky
if [[ "${INSTALL_FLUKY}" -ne 1 ]]; then
    echo "Skipping Fluky installation."
else
    echo "Installing Fluky..."
    [ -d fluky ] && rm -rf fluky
    git clone https://github.com/foolnotion/fluky fluky
    pushd fluky
    cmake -S . -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX}
    cmake --install build
    popd
    rm -rf fluky
fi

## vstat
if [[ "${INSTALL_VSTAT}" -ne 1 ]]; then
    echo "Skipping vstat installation."
else
    echo "Installing vstat..."
    [ -d vstat ] && rm -rf vstat
    git clone https://github.com/heal-research/vstat.git
    pushd vstat
    git checkout 428ec2385aebf44d9ba89064b2b2ef419fd6206a
    cmake -S . -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TESTING=OFF \
        -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX}
    cmake --install build
    popd
    rm -rf vstat
fi

## fast-float
if [[ "${INSTALL_FAST_FLOAT}" -ne 1 ]]; then
    echo "Skipping fast_float installation."
else
    echo "Installing fast_float..."
    [ -d fast_float ] && rm -rf fast_float
    git clone https://github.com/fastfloat/fast_float.git
    pushd fast_float
    git checkout f476bc713fda06fbd34dc621b466745a574b3d4c
    cmake -S . -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DFASTLOAT_TEST=OFF \
        -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX}
    cmake --install build
    popd
    rm -rf fast_float
fi

## pratt-parser
if [[ "${INSTALL_PRATT_PARSER}" -ne 1 ]]; then
    echo "Skipping pratt-parser installation."
else
    echo "Installing pratt-parser..."
    [ -d pratt-parser-calculator ] && rm -rf pratt-parser-calculator
    git clone https://github.com/foolnotion/pratt-parser-calculator.git
    pushd pratt-parser-calculator
    git checkout 5093c67e2e642178cce1bc455f7dee8720820642
    cmake -S . -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TESTING=OFF \
        -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX}
    cmake --install build
    popd
    rm -rf pratt-parser-calculator
fi

## unordered_dense
if [[ "${INSTALL_UNORDERED_DENSE}" -ne 1 ]]; then
    echo "Skipping unordered_dense installation."
else
    echo "Installing unordered_dense..."
    [ -d unordered_dense ] && rm -rf unordered_dense
    git clone https://github.com/martinus/unordered_dense.git
    pushd unordered_dense
    git checkout v4.5.0
    cmake -S . -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX}
    cmake --install build
    popd
    rm -rf unordered_dense
fi

## cpp-sort
if [[ "${INSTALL_CPPSORT}" -ne 1 ]]; then
    echo "Skipping cpp-sort installation."
else
    echo "Installing cpp-sort..."
    [ -d cpp-sort ] && rm -rf cpp-sort
    git clone https://github.com/Morwenn/cpp-sort.git
    pushd cpp-sort
    git checkout 31dd8e9574dfc21e87d36794521b9e0a0fd6f5f6
    cmake -S . -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCPPSORT_BUILD_TESTING=OFF \
        -DCPPSORT_BUILD_EXAMPLES=OFF \
        -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX}
    cmake --install build
    popd
    rm -rf cpp-sort
fi

## fmt (conda only includes the shared library and we want the static)
if [[ "${INSTALL_FMT}" -ne 1 ]]; then
    echo "Skipping fmt installation."
else
    echo "Installing fmt..."
    [ -d fmt ] && rm -rf fmt
    git clone https://github.com/fmtlib/fmt.git
    pushd fmt
    mkdir build
    pushd build
    git checkout 11.1.3
    cmake .. \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=OFF \
        -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
        -DFMT_TEST=OFF \
        -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX}
    make install
    popd
    popd
    rm -rf fmt
fi

## microsoft-gsl
if [[ "${INSTALL_MICROSOFT_GSL}" -ne 1 ]]; then
    echo "Skipping Microsoft GSL installation."
else
    echo "Installing Microsoft GSL..."
    [ -d GSL ] && rm -rf GSL
    git clone https://github.com/microsoft/GSL.git
    pushd GSL
    git checkout 355982daf6c54ccb11bef8a1c511be2622dec402
    cmake -S . -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX} \
        -DGSL_INSTALL=1 \
        -DGSL_TEST=0
    cmake --install build
    popd
    rm -rf GSL
fi

# span-lite
if [[ "${INSTALL_SPAN_LITE}" -ne 1 ]]; then
    echo "Skipping span-lite installation."
else
    echo "Installing span-lite..."
    [ -d span-lite ] && rm -rf span-lite
    git clone https://github.com/martinmoene/span-lite.git
    pushd span-lite
    git checkout 50f55c59d1b66910837313c40d11328d03447a41
    cmake -S . -B build \
        -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX}
    cmake --install build
    popd
    rm -rf span-lite
fi

# byte-lite
if [[ "${INSTALL_BYTE_LITE}" -ne 1 ]]; then
    echo "Skipping byte-lite installation."
else
    echo "Installing byte-lite..."
    [ -d byte-lite ] && rm -rf byte-lite
    git clone https://github.com/martinmoene/byte-lite.git
    pushd byte-lite
    git checkout dd5b3827f7cd74c1f399d1ec2c063982d3442a99
    cmake -S . -B build -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX}
    cmake --install build
    popd
    rm -rf byte-lite
fi

## quickcpplib
if [[ "${INSTALL_QUICKCPPLIB}" -ne 1 ]]; then
    echo "Skipping quickcpplib installation."
else
    echo "Installing quickcpplib..."
    [ -d quickcpplib ] && rm -rf quickcpplib
    git clone https://github.com/ned14/quickcpplib.git
    pushd quickcpplib
    git checkout 72277c70f925829935a2af846731ab36063ec16f
    cmake -S . -B build \
        -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX} \
        -DCMAKE_BUILD_TYPE=Release
    cmake --install build
    popd
    rm -rf quickcpplib
fi

## status-code
if [[ "${INSTALL_STATUS_CODE}" -ne 1 ]]; then
    echo "Skipping status-code installation."
else
    echo "Installing status-code..."
    [ -d status-code ] && rm -rf status-code
    git clone https://github.com/ned14/status-code.git
    pushd status-code
    git checkout a35d88d692a23a89a39d45dee12a629fffa57207
    cmake -S . -B build \
        -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX} \
        -DCMAKE_BUILD_TYPE=Release
    cmake --install build
    popd
    rm -rf status-code
fi

## outcome
if [[ "${INSTALL_OUTCOME}" -ne 1 ]]; then
    echo "Skipping outcome installation."
else
    echo "Installing outcome..."
    [ -d outcome ] && rm -rf outcome
    #git clone https://github.com/ned14/outcome.git
    rm -f outcome-v2-all-sources.tar.xz
    wget -nc https://github.com/ned14/outcome/releases/download/v2.2.12/outcome-v2-all-sources.tar.xz
    tar -xvf ./outcome-v2-all-sources.tar.xz
    pushd outcome
    #git checkout 571f9c930e672950e99d5d30f743603aaaf8014c
    cmake -S . -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DPROJECT_IS_DEPENDENCY=ON \
        -DOUTCOME_BUNDLE_EMBEDDED_QUICKCPPLIB=OFF \
        -Dquickcpplib_DIR=${INSTALL_PREFIX} \
        -DOUTCOME_BUNDLE_EMBEDDED_STATUS_CODE=OFF \
        -Dstatus-code_DIR=${INSTALL_PREFIX} \
        -DOUTCOME_ENABLE_DEPENDENCY_SMOKE_TEST=OFF \
        -DCMAKE_DISABLE_FIND_PACKAGE_Git=ON \
        -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX}
    cmake --install build
    popd
    rm -rf outcome
fi

## lbfgs
if [[ "${INSTALL_LBFGS}" -ne 1 ]]; then
    echo "Skipping lbfgs installation."
else
    echo "Installing lbfgs..."
    [ -d lbfgs ] && rm -rf lbfgs
    git clone https://github.com/foolnotion/lbfgs.git
    pushd lbfgs
    git checkout 0ac2cb5b8ffea5e3e71f264d8e2d37d585449512
    cmake -S . -B build -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_EXAMPLES=OFF \
        -DBUILD_TESTING=OFF \
        -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX} \
        -DCMAKE_PREFIX_PATH=${INSTALL_PREFIX}/lib64/cmake
    cmake --install build
    popd
    rm -rf lbfgs
fi

# taskflow
if [[ "${INSTALL_TASKFLOW}" -ne 1 ]]; then
    echo "Skipping taskflow installation."
else
    echo "Installing taskflow..."
    [ -d taskflow ] && rm -rf taskflow
    git clone https://github.com/taskflow/taskflow.git
    pushd taskflow
    git checkout v3.9.0
    mkdir build
    cmake -S . -B build \
        -DTF_BUILD_EXAMPLES=OFF \
        -DTF_BUILD_TESTS=OFF \
        -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX}
    cmake --install build
    popd
    rm -rf taskflow
fi

# mdspan
if [[ "${INSTALL_MDSPAN}" -ne 1 ]]; then
    echo "Skipping mdspan installation."
else
    echo "Installing mdspan..."
    [ -d mdspan ] && rm -rf mdspan
    git clone https://github.com/kokkos/mdspan.git
    pushd mdspan
    git checkout 0e6a69dfe045acbb623003588a4aff844ea4b276
    mkdir build
    cmake -S . -B build \
        -DCMAKE_CXX_STANDARD=20 \
        -DMDSPAN_CXX_STANDARD=20 \
        -DMDSPAN_ENABLE_TESTS=OFF \
        -DMDSPAN_ENABLE_BENCHMARKS=OFF \
        -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX}
    cmake --install build
    popd
    rm -rf mdspan
fi

# cpptrace
if [[ "${INSTALL_CPPTRACE}" -ne 1 ]]; then
    echo "Skipping cpptrace installation."
else
    echo "Installing cpptrace..."
    [ -d cpptrace ] && rm -rf cpptrace
    git clone https://github.com/jeremy-rifkin/cpptrace.git
    pushd cpptrace
    cmake -S . -B build \
       -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX} \
       -DCPPTRACE_USE_EXTERNAL_ZSTD=0 \
       -DCPPTRACE_GET_SYMBOLS_WITH_LIBDWARF=0
    cmake --build build
    cmake --install build
    popd
    rm -rf cpptrace
fi

# libassert
if [[ "${INSTALL_LIBASSERT}" -ne 1 ]]; then
    echo "Skipping libassert installation."
else
    echo "Installing libassert..."
    [ -d libassert ] && rm -rf libassert
    git clone https://github.com/jeremy-rifkin/libassert.git
    pushd libassert
    git checkout v2.1.4
    mkdir build
    cmake -S . -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DLIBASSERT_USE_EXTERNAL_CPPTRACE=1 \
        -DBUILD_SHARED_LIBS=OFF \
        -DCMAKE_POSITION_INDEPENDENT_CODE=1 \
        -DCMAKE_CXX_FLAGS="-fPIC" \
        -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX}
    cmake --build build
    cmake --install build
    popd
    rm -rf libassert
fi

## operon
[ -d operon ] && rm -rf operon
git clone https://github.com/heal-research/operon.git
pushd operon
git checkout a9c25d42ca2e9ff2664b5803482340cef789fe8a
mkdir build
cmake -S . -B build --preset build-${PLATFORM} \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_CLI_PROGRAMS=OFF \
    -DBUILD_TESTING=OFF \
    -DBUILD_SHARED_LIBS=OFF \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
    -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX} \
    -DCMAKE_PREFIX_PATH=${INSTALL_PREFIX}/lib64/cmake
cmake --build build -j -t operon_operon
cmake --install build
popd
rm -rf operon

set +e
