set -ex

export HIPSYCL_CPU_CXX=${CXX}
export HIPSYCL_TARGETS='omp.accelerated'

mkdir build
cd build

cmake ../tests -GNinja

cmake --build . -v -j $CPU_COUNT

./device_compilation_tests
./rt_tests
./sycl_tests
