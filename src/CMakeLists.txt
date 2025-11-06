cmake_minimum_required(VERSION 3.20)

set(RELEASE_VERSION 1.23.0)
project (MIT-KRB5 VERSION ${RELEASE_VERSION})

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/out)
set(ROOT_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
set(UTIL_DIR ${ROOT_DIR}/util)

# cmake_path(GET CMAKE_CURRENT_SOURCE_DIR PARENT_PATH ROOT_DIR)

set(ROOT_INCLUDE_DIR   "")
set(WINVER_INCLUDE_DIR "")
set(KRB5_INCLUDE_DIR   "")
set(GSSAPI_INCLUDE_DIR "")
set(UTIL_ET_INCLUDE_DIR "")

list(APPEND ROOT_INCLUDE_DIR    ${ROOT_DIR})
list(APPEND ROOT_INCLUDE_DIR    ${ROOT_DIR}/include)
list(APPEND WINVER_INCLUDE_DIR  ${ROOT_DIR}/windows)
list(APPEND WINVER_INCLUDE_DIR  ${ROOT_DIR}/windows/include)
# list(APPEND KRB5_INCLUDE_DIR    ${ROOT_DIR}/include/krb5)


message("===> ROOT_INCLUDE_DIR ====> ${ROOT_INCLUDE_DIR}")
message("===> WINVER_INCLUDE_DIR ==> ${WINVER_INCLUDE_DIR}")

# if(CMAKE_GENERATOR STREQUAL "MinGW Makefiles")
#     message("Building with MinGW Makefiles generator.")
# else()
#     # message(FATAL_ERROR "Only the MinGW compiler is supported!")
# endif()

include(cmake/cmake_gen.txt)

add_subdirectory(windows/lib)
add_subdirectory(util/support)
add_subdirectory(util/et)
add_subdirectory(util/profile)
add_subdirectory(lib/krb5)
# add_subdirectory(kfwlogon)
