set(CONFIGURED_DIR "./") # must be a relative path. CMAKE_BINARY_DIR is prefixed automatically by CMake

configure_file("config.hpp.in" "${CONFIGURED_DIR}/config.hpp" ESCAPE_QUOTES)
