@echo off
echo:
echo *****************************************************************
echo *    Build the openssl library                                  *
echo *    https://github.com/openssl/openssl                         *
echo *****************************************************************
echo:

set OPENSSL_DIR=%cd%\openssl\
if exist %OPENSSL_DIR% rmdir %OPENSSL_DIR% /q /s
@REM git clone --recursive https://github.com/openssl/openssl %OPENSSL_DIR%
git clone --recursive --depth 1 --single-branch --branch openssl-3.6.0 https://github.com/openssl/openssl.git %OPENSSL_DIR%
cd %OPENSSL_DIR%
