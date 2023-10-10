::                                  Settings- Traffic waster

::-------------------------------------------------------

::   file link
::   enable only one before using (delete"::" before "set")

::   CN file link
set link=https://dl.hdslb.com/mobile/fixed/bili_win/bili_win-install.exe

::   Global file link
::set link=https://jp.edis.at/1000MB.test

::-------------------------------------------------------

::   proxy http
::   enable or add one if need (delete"::" before "set")

::set aproxy=172.16.0.2:8899
::set aproxy=127.0.0.1:7890

::-------------------------------------------------------

::   multi thread download

set thread=32

::-------------------------------------------------------

::!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
::                                  Do Not Modify
::-------------------------------------------------------

@echo off
title Traffic Waster 2.0
mode con cols=60 lines=20
color 0a
cd /d %~dp0
set timest=%time%
set cproxy= -f
if defined aproxy set cproxy= -x %aproxy%
if not defined aproxy set aproxy=No

:loops
cls
echo Consuming data...
echo.
echo Starting time : %timest%
echo Time now : %time%
echo.
echo Threads : %thread%
echo File link : "%link%"
echo Proxy : "%aproxy%"
echo.
echo Close window to stop
echo.

for /F %%i in ('tasklist ^| findstr /I /C:"curl.exe" ^| find /C "."') do set running=%%i
set /A threads_needed=%thread%-%running%
echo Threads running: %running%, additional threads needed: %threads_needed%

if %threads_needed% GTR 0 (
    for /L %%j in (1,1,%threads_needed%) do (
        start /b curl -s -q%cproxy% -L -f -k --raw -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.13 Safari/537.36" %link% --output nul
    )
)

:: Check for new threads every second
timeout /t 1 >nul

goto loops
