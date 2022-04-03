#!/usr/bin/env bash

set -ex
# Prints versions of all relevant installed tools. Fails if those tools do not exist.

cat /etc/lsb-release
g++ --version
clang++ --version
clang-format --version
python3 --version
pip --version
conan --version
cmake --version
ccmake --version
cppcheck --version
doxygen --version
include-what-you-use --version
cmake-format --version

