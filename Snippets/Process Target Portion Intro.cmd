@echo off
title Windows Affinity - Adrian





echo [Loading bars not included]
echo.
echo.
echo : [9] Always goes back, and numbers input that are not defined go back
echo.
echo : [ ] Input on query instantly exits
echo.
echo : [0] Input on query undoes everything
echo.
echo.
pause
goto :101





:inputNumberCleanseLoop
  SET "var="&for /f "delims=0123456789" %%i in ("%inputNumber%") do set var=%%i
  if defined var (
    if "%inputNumber%"==" " goto 000
    cls
    goto %currentLoop%
  )
  if "%inputNumber%"=="0" goto 001
  goto nextLoopSet
REM Goes to loop 000 if the user entered [ ] space, goes to loop 001 if the user entered [0]
REM Otherwise goes to set the next loop

:nextLoopSet
  REM Sets the next loop, separated in case I want to call it on its own
  set /a nextLoop=%currentLoop%+1
goto %nextLoop%



:101
  REM Initial Loop Stage 1

  set currentLoop=101
  cls
  echo [Hub]
  echo.
  echo.

  echo [1] Target Process
  REM Goes to the set of loops [11x]
  echo [2] Core Allocation
  REM Goes to the set of loops [12x]

  set inputNumber=
  set /P inputNumber=Type input: %=%
  goto inputNumberCleanseLoop
  REM Next loop: 102

goto :101
REM Repeats loop if invalid input given


  :102
    REM Initial Loop Stage 2
    if /I "%inputNumber%"=="1" goto 111
    if /I "%inputNumber%"=="2" goto 121
    if /I "%inputNumber%"=="3" goto 131
  goto 101





:111
  REM Target Process

  set currentLoop=111
  cls
  echo [Hub ^> Target Process]
  echo.
  echo.
  if /I "%processName%" NEQ "" (
    echo Process name is currently set to [%processName%]
    echo.
    echo.
  )
  echo [1] Change process name.
  REM Goes to loop 113
  echo [2] View all processes.
  REM Goes to loop processList
  echo [3] View all processes matching executable name
  REM Goes to loop matchingProcessList

  set inputNumber=
  set /P inputNumber=Type input: %=%
  goto inputNumberCleanseLoop
  REM Next loop: 112
  pause
goto 101

  :112
    REM Initial Loop Stage 2

    if /I "%inputNumber%"=="1" goto 113
    REM Change process name
    if /I "%inputNumber%"=="2" goto processList
    if /I "%inputNumber%"=="3" goto matchingProcessList
  goto 101
  REM If input is 4-9 goes to loop 101

      :113
        set currentLoop=113
        cls
        echo [Hub ^> Target Process ^> Change Process Name]
        echo.
        echo.
        echo Don't add the executable [.exe] extension.
        set processName=
        set /P processName=Type input: %=%
      goto 111





:processList
  cls
  echo [All Processes]
  echo [All Processes]
  echo [All Processes]
  tasklist
  echo [All Processes]
  echo [All Processes]
  echo [All Processes]
  pause
  goto %currentLoop%

:matchingProcessList
  cls
  if "%processName%"=="" goto processNameNotGiven
  echo [Processes Matching Executable Name]
  echo.
  echo.
  tasklist /FI "imagename eq %processName%.exe"
  pause
goto %currentLoop%

:processNamePrint
  cls
  if "%processName%"=="" goto processNameNotGiven
  echo [User Given Process Name]
  echo.
  echo.
  echo Process name set to [%processName%]
  pause
goto %currentLoop%

:processNameNotGiven
  echo Process name was not given
  pause
goto %currentLoop%










:112
  pause
goto :101

:001
  cls
  REM add stuff to do stuff (reset affinity, cancel all shutdown timers when merged with shutdown script)
  echo Quitting.
pause

:000
