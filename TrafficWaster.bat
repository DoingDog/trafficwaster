::                                  Settings- Traffic waster

::-------------------------------------------------------

::   file link
::   enable only one before using (delete"::" before "set")

::   CN file link
set link=https://res.ldmnq.com/download/4.0/ldinst64_4.0.82.exe

::   Global file link
::set link=https://jp.edis.at/1000MB.test

::-------------------------------------------------------

::   proxy http
::   enable or add one if need (delete"::" before "set")

::set aproxy=172.16.0.2:8899
::set aproxy=127.0.0.1:7890

::-------------------------------------------------------

::   multi thread download

set thread=16

::   auto refresh seconds

set refr=30

::-------------------------------------------------------






















::!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
::                                  Do Not Modify
::-------------------------------------------------------
@echo off
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
echo Auto refresh time : %refr%s
echo File link : "%link%"
echo Proxy : "%aproxy%"
echo.
echo Close window to stop
echo Press Y to refresh if failing or stuck
echo.
for /l %%s in (1,1,%thread%) do (
start /b curl -s -q%cproxy% -L -f -k --raw -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.13 Safari/537.36" %link% --output nul
)
choice /t %refr% /d y /n >nul
taskkill /f /im curl.exe
goto loops
