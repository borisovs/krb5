@echo off
echo:
echo *****************************************************************
echo *    Before build install MSYS2 and add it to PATH              *
echo *    https://github.com/msys2/msys2-installer/releases          *
echo *    in order to have perl/awk/cat/git                          *
echo *****************************************************************
echo:

set OUTPUT=%cd%\output\

if exist %OUTPUT% rmdir %OUTPUT% /q /s
mkdir %OUTPUT%
set PATH=%PATH%;"%WindowsSdkVerBinPath%"\x86  
set KRB_INSTALL_DIR=%OUTPUT%
@REM et OPENSSL_DIR=C:\OpenSSL-Win64
@REM set OPENSSL_VERSION=3

echo on
cd src
nmake -f Makefile.in prep-windows
nmake NODEBUG=1
nmake install NODEBUG=1
rem cd windows\installer\wix
rem nmake [NODEBUG=1]
