@echo off
echo:
echo *******************************************
echo *    Before build install Perl language   *
echo *    https://strawberryperl.com/          *
echo *******************************************
echo:

set OUTPUT=%cd%\output 

if exist %OUTPUT% rmdir %OUTPUT% /q /s
mkdir %OUTPUT%

echo on
set PATH=%PATH%;"%WindowsSdkVerBinPath%"\x86  
set KRB_INSTALL_DIR=%OUTPUT%
rem set OPENSSL_DIR=C:\OpenSSL-Win64
rem set OPENSSL_VERSION=3
cd src
nmake clean
nmake -f Makefile.in prep-windows
nmake NODEBUG=1
nmake install NODEBUG=1
rem cd windows\installer\wix
rem nmake [NODEBUG=1]
