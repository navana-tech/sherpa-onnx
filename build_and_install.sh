#!/bin/bash

# Remove the existing build directory and create a new one
rm -rf build-shared
mkdir build-shared
cd build-shared || exit

# Run CMake with the specified options
cmake \
  -DSHERPA_ONNX_ENABLE_C_API=ON \
  -DCMAKE_BUILD_TYPE=Release \
  -DBUILD_SHARED_LIBS=ON \
  -DCMAKE_INSTALL_PREFIX=/tmp/sherpa-onnx/shared \
  ..

# Build the project using make
make -j6

# Install the built files
make install

# Copy the shared libraries to the specified destination
cd /tmp/sherpa-onnx/shared/lib || exit
cp *.so /home/navanadev/bodhi-prod/bodhi-go-server/sherpa-onnx-go-linux/lib/x86_64-unknown-linux-gnu/.
