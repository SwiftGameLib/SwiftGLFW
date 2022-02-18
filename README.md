# SwiftGLFW
This is a Swiftified wrapper interface for [GLFW](https://www.glfw.org).

## Installation
Before using this Package you will need to build and install GLFW from source.
Support for installing GLFW via homebrew is not available at this time.
To install GLFW run the following commands in Terminal from the directory where you wish to checkout GLFW:
```
git clone https://github.com/glfw/glfw.git
cd glfw
mkdir build
cd build
export MACOSX_DEPLOYMENT_TARGET=10.14
cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_OSX_ARCHITECTURES="x86_64;arm64" -D BUILD_SHARED_LIBS=ON -D CMAKE_C_COMPILER=clang ../
make
sudo make install
```

This will build a x86-64/ARM64 fat library and install it in `/usr/local` where SPM can find it.

## Usage
This package can be used as a dependency in your Package.swift file like so:
`.package(name: "SwiftGLFW", url: "https://github.com/SwiftGameLib/SwiftGLFW")`
