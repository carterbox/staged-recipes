set -ex

mkdir build
cd build

cmake .. \
    -DWITH_ACCELERATED_CPU:BOOL=OFF \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    ${CMAKE_ARGS}

cmake --build . -v -j $CPU_COUNT

cmake --install . -v
