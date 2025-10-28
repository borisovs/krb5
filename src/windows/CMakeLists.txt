cmake_minimum_required(VERSION 3.10)
project (MIT-KRB5 VERSION 1.0.0)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/out)

set(ROOT_DIR ${CMAKE_CURRENT_SOURCE_DIR})

if(CMAKE_GENERATOR STREQUAL "MinGW Makefiles")
    message("Building with MinGW Makefiles generator.")
else()
    # message(FATAL_ERROR "Only the MinGW compiler is supported!")
endif()

add_subdirectory(lib)
