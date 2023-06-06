#!/bin/bash

set -e

mkdir build

cd build

cmake ${CMAKE_ARGS} \
      -DCMAKE_CXX_STANDARD=17 \
      -DCMAKE_PREFIX_PATH=$PREFIX \
      -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DCMAKE_BUILD_TYPE=Release \
      -DS2GEOGRAPHY_BUILD_TESTS=$BUILD_TESTS \
      -DS2GEOGRAPHY_CODE_COVERAGE=OFF \
      $SRC_DIR

cmake --build . -- -j${CPU_COUNT}

cmake --build . -- install