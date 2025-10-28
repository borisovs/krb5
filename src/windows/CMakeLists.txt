cmake_minimum_required(VERSION 3.20)

set(RELEASE_VERSION 1.23.0)
project (MIT-KRB5 VERSION ${RELEASE_VERSION})

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/out)

cmake_path(GET CMAKE_CURRENT_SOURCE_DIR PARENT_PATH ROOT_DIR)
set(WIN_DIR ${CMAKE_CURRENT_SOURCE_DIR})

# if(CMAKE_GENERATOR STREQUAL "MinGW Makefiles")
#     message("Building with MinGW Makefiles generator.")
# else()
#     # message(FATAL_ERROR "Only the MinGW compiler is supported!")
# endif()

add_subdirectory(lib)
