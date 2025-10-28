cmake_minimum_required(VERSION 3.20)
project (krb5 LANGUAGES C)

set(TARGET_NAME krb5)
set(TARGET_INCLUDES)
set(TARGET_LIBRARIES)

# list(APPEND MODULE_INCLUDE_DIRECTORIES ${CMAKE_BINARY_DIR}/generated)

file(GLOB_RECURSE SOURCES "*.c")
file(GLOB_RECURSE HEADERS "*.h")

list(APPEND TARGET_INCLUDES "${CMAKE_CURRENT_SOURCE_DIR}")
list(APPEND TARGET_INCLUDES "${WIN_DIR}/include")

list(APPEND TARGET_LIBRARIES "win")

add_library(${TARGET_NAME} ${HEADERS} ${SOURCES})

set_target_properties(${TARGET_NAME} PROPERTIES
                      C_STANDARD 17
                      C_STANDARD_REQUIRED ON
)

# target_compile_options(${TARGET_NAME} PRIVATE ${TARGET_COMPILE_OPTIONS})
target_include_directories(${TARGET_NAME} PRIVATE ${TARGET_INCLUDES})
target_link_libraries (${TARGET_NAME} PRIVATE ${TARGET_LIBRARIES})
