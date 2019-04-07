@echo off
title Kill The Bitch!
:Question
echo Would you like to kill this shit Operating System?(Y/N)

set INPUT=
set /P INPUT=Type input: %=%
If /I "%INPUT%"=="Y" goto KillTheBitch
If /I "%INPUT%"=="N" goto NoNoNoWait
If /I "%INPUT%"=="Yes" goto KillTheBitch
If /I "%INPUT%"=="No" goto NoNoNoWait
goto :Question

:KillTheBitch
echo Shutting down Spyware/Windows
shutdown /s /t 5
goto :QuitOrSomething

:NoNoNoWait
echo You're a motherfucking pussy ass bitch.
goto :QuitOrSomething

:QuitOrSomething
echo 3301
pause
