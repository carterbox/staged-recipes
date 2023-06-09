set -ex

mkdir build
cd build

cmake ../examples -GNinja

cmake --build . -v -j $CPU_COUNT

ls -la

./bruteforce_nbody/bruteforce_nbody
