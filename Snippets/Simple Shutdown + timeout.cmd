@echo off
title Windows Shutdown
:Question
echo Would you like to Shutdown Windows?(Y/N)

set INPUT=
set /P INPUT=Type input: %=%
If /I "%INPUT%"=="Y" goto yShutdown
If /I "%INPUT%"=="N" goto nShutdown
If /I "%INPUT%"=="Yes" goto yShutdown
If /I "%INPUT%"=="No" goto nShutdown
goto :Question

:yShutdown
echo Shutting down Windows in 10 seconds.
timeout /T 5 /nobreak
shutdown /s /t 5
goto :endScript

:nShutdown
echo Shutting down Aborted.
goto :endScript

:endScript
pause




