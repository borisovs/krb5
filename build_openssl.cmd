@echo off
echo:
echo *****************************************************************
echo *    Build the openssl library                                  *
echo *    https://github.com/openssl/openssl                         *
echo *****************************************************************
echo:

set SRC_DIR=%cd%\openssl_src\
if exist %SRC_DIR% rmdir %SRC_DIR% /q /s
git clone --recursive --depth 1 --single-branch --branch openssl-3.6.0 https://github.com/openssl/openssl.git %SRC_DIR%
cd %SRC_DIR%

set PATH=%PATH%;"C:\Program Files\NASM"
set PATH=%PATH%;"C:\Strawberry\perl\bin"

set %OPENSSL_DIR%=%cd%\openssl\
if exist %OPENSSL_DIR% rmdir %OPENSSL_DIR% /q /s
mkdir %OPENSSL_DIR%

perl Configure --prefix=%OPENSSL_DIR% VC-WIN64A no-shared enable-capieng
nmake
