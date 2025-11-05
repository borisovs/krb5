cmake_minimum_required(VERSION 3.20)
project (support LANGUAGES C)

set(TARGET_NAME krb5sprt)
set(TARGET_INCLUDES)
set(TARGET_LIBRARIES)
set(TARGET_COMPILER_DEFS)


set(SOURCES threads.c
            init-addrinfo.c
            plugins.c
            errors.c
            k5buf.c
            gmt_mktime.c
            # fake-addrinfo.c
            utf8.c
            # utf8_conv.c
            # gettimeofday.c
            strlcpy.c
            fnmatch.c
            printf.c
            mkstemp.c
            t_k5buf.c
            # t_unal.c
            # t_path.c
            # t_json.c
            # t_hex.c
            # t_hashtab.c
            zap.c
            path.c
            base64.c
            json.c
            hex.c
            hashtab.c
            bcmp.c
            strerror_r.c
            dir_filenames.c
            # t_utf8.c
            # t_utf16.c
            # getopt.c
            # getopt_long.c
            # secure_getenv.c
            regex.cpp
)

# file(GLOB_RECURSE SOURCES "*.c")
file(GLOB_RECURSE HEADERS "*.h")

list(APPEND TARGET_INCLUDES "${ROOT_INCLUDE_DIR}")
list(APPEND TARGET_INCLUDES "${UTIL_DIR}/support")

# list(APPEND TARGET_COMPILER_DEFS "HAVE_GETRESUID=1")
# list(APPEND TARGET_COMPILER_DEFS "HAVE_GETRESGID=1")
# list(APPEND TARGET_COMPILER_DEFS "HAVE_GETPWUID_R=1")

# list(APPEND TARGET_COMPILER_DEFS "WIN32_LEAN_AND_MEAN=1")
list(APPEND TARGET_COMPILER_DEFS "KRB5_DEPRECATED=1")
list(APPEND TARGET_COMPILER_DEFS "KRB5_PRIVATE=1")
# list(APPEND TARGET_COMPILER_DEFS "_CRT_SECURE_NO_DEPRECATE=1")

list(APPEND TARGET_LIBRARIES "win")
list(APPEND TARGET_LIBRARIES "ws2_32")

add_library(${TARGET_NAME} SHARED ${HEADERS} ${SOURCES})

set_target_properties(${TARGET_NAME}${BITS} PROPERTIES
                      C_STANDARD 17
                      C_STANDARD_REQUIRED ON
)

# target_compile_options(${TARGET_NAME} PRIVATE ${TARGET_COMPILE_OPTIONS})
target_compile_definitions(${TARGET_NAME} PUBLIC ${TARGET_COMPILER_DEFS})
target_include_directories(${TARGET_NAME} PRIVATE ${TARGET_INCLUDES})
target_link_libraries (${TARGET_NAME} PRIVATE ${TARGET_LIBRARIES})
