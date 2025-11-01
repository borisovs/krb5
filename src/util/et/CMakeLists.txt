cmake_minimum_required(VERSION 3.20)
project (et LANGUAGES C)

set(TARGET_NAME comerr)
set(TARGET_INCLUDES)
set(TARGET_LIBRARIES)

set(SOURCES error_message.c
            et_name.c
            com_err.c
)

set(HEADERS com_err.h)

list(APPEND TARGET_INCLUDES "${ROOT_INCLUDE_DIR}")
list(APPEND TARGET_INCLUDES "${UTIL_DIR}/et")
# list(APPEND TARGET_INCLUDES "${ROOT_DIR}/util")

list(APPEND TARGET_LIBRARIES "win")
list(APPEND TARGET_LIBRARIES "krb5sprt")

add_library(${TARGET_NAME} SHARED ${HEADERS} ${SOURCES})

set_target_properties(${TARGET_NAME}${BITS} PROPERTIES
                      C_STANDARD 17
                      C_STANDARD_REQUIRED ON
)

# target_compile_options(${TARGET_NAME} PRIVATE ${TARGET_COMPILE_OPTIONS})
target_include_directories(${TARGET_NAME} PRIVATE ${TARGET_INCLUDES})
target_link_libraries (${TARGET_NAME} PRIVATE ${TARGET_LIBRARIES})
