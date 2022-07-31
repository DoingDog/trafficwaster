::                                  Settings
::-------------------------------------------------------
::file size kb
set fsize=207601
::file link
set link=https://issuepcdn.baidupcs.com/issue/netdisk/yunguanjia/BaiduNetdisk_7.16.1.11.exe

::proxy http
::set aproxy=127.0.0.1:8899
::-------------------------------------------------------













::!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
::                                  Do Not Modify
::-------------------------------------------------------
@echo off
cd /d %~dp0
set cproxy= -f
if defined aproxy set cproxy= -x %aproxy%
set tcnt=0
set kbcnt=0
set mbcnt=000
set gbcnt=0
set http_proxy=%https_proxy%
:loops
cls
echo Network Count:
echo.
echo -------------------------------------------------------
echo.
echo Completed downloading a %fsize% KB file %tcnt% times
echo.
echo %gbcnt% GB and %mbcnt% MB is Consumed
echo.
echo Now consuming
echo.

curl -q%cproxy% -L -k --raw -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.13 Safari/537.36" %link% --progress-bar --output nul

set /a tcnt+=1
set /a kbcnt+=%fsize%
set /a mbcnt=%kbcnt%/1024
set /a gbcnt=%mbcnt%/1024
set /a mbcnt-=%gbcnt%*1024
goto loops
