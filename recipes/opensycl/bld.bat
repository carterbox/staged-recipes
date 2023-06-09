
mkdir build
cd build

echo "CMAKE_ARGS are %CMAKE_ARGS%"

cmake .. ^
    -DBUILD_SHARED_LIBS:BOOL=ON ^
    %CMAKE_ARGS%

cmake --build . -v

cmake --install . -v
