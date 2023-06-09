set -ex

export HIPSYCL_CPU_CXX=${CXX}

mkdir build
cd build

cmake ../tests -GNinja

cmake --build . -v -j $CPU_COUNT

./device_compilation_tests
./rt_tests
./sycl_tests
