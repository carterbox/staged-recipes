set -ex

mkdir build
cd build

cmake .. \
    -DWITH_ACCELERATED_CPU:BOOL=ON \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    ${CMAKE_ARGS}

cmake --build . -v -j $CPU_COUNT

cmake --install . -v

# Replace compiler path in /etc/hipSYCL/syclcc.json because conda-build doesn't
# relocate build prefixes. Setting the default-cpu-cxx to $CXX doesn't work.
# https://github.com/conda/conda-build/issues/2677
# https://github.com/conda/conda-build/issues/2995
sed -i'.backup' -e '/"default-cpu-cxx"/c\  "default-cpu-cxx"   : "",' $PREFIX/etc/hipSYCL/syclcc.json
