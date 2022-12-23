## Docker Instructions

If you have [Docker](https://www.docker.com/) installed, you can run this
in your terminal, when the Dockerfile is inside the `.devcontainer` directory:

```bash
docker build -f ./.devcontainer/Dockerfile --tag=my_project:latest .
docker run -it my_project:latest
```

This command will put you in a `bash` session in a Ubuntu 22.04 Docker container,
with all of the tools listed in the [Dependencies](#dependencies) section already installed.
Additionally, you will have `g++-12` and `clang++-15` installed as the default
versions of `g++` and `clang++`.

If you want to build this container using some other versions of gcc and clang,
you may do so with the `GCC_VER` and `LLVM_VER` arguments:

```bash
docker build --tag=myproject:latest --build-arg GCC_VER=11 --build-arg LLVM_VER=14 .
```

The CC and CXX environment variables are set to GCC by default.
If you wish to use clang as your default CC and CXX environment variables, you
may do so like this:

```bash
docker build --tag=my_project:latest --build-arg USE_CLANG=1 .
```

You will be logged in as root, so you will see the `#` symbol as your prompt.
You will be in a directory that contains a copy of the `cmake_conan_boilerplate_template`;
any changes you make to your local copy will not be updated in the Docker image
until you rebuild it.
If you need to mount your local copy directly in the Docker image, see
[Docker volumes docs](https://docs.docker.com/storage/volumes/).
TLDR:

```bash
docker run -it \
	-v absolute_path_on_host_machine:absolute_path_in_guest_container \
	my_project:latest
```

You can configure and build [as directed above](#build) using these commands:

```bash
/cmake_conan_boilerplate_template# mkdir build
/cmake_conan_boilerplate_template# cmake -S . -B ./build
/cmake_conan_boilerplate_template# cmake --build ./build
```

You can configure and build using `clang`, without rebuilding the container,
with these commands:

```bash
/cmake_conan_boilerplate_template# mkdir build
/cmake_conan_boilerplate_template# CC=clang CXX=clang++ cmake -S . -B ./build
/cmake_conan_boilerplate_template# cmake --build ./build
```

The `ccmake` tool is also installed; you can substitute `ccmake` for `cmake` to
configure the project interactively.
All of the tools this project supports are installed in the Docker image;
enabling them is as simple as flipping a switch using the `ccmake` interface.
Be aware that some of the sanitizers conflict with each other, so be sure to
run them separately.

A script called `build_examples.sh` is provided to help you to build the example
GUI projects in this container.

