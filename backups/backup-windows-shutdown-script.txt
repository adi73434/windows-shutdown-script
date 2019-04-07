@echo off
title Windows Batchscript - Adrian
goto :101

:inputNumberCleanseLoop
  SET "var="&for /f "delims=0123456789" %%i in ("%inputNumber%") do set var=%%i
  if defined var (
    if "%inputNumber%"==" " goto 000
    cls
    goto %currentLoop%
  )
  if "%inputNumber%"=="0" goto 001
  set /a nextLoop=%currentLoop%+1
  goto %nextLoop%

:101 REM Initial Loop Stage 1
  set currentLoop=101
  cls
  echo What would you like to do?
  echo.
  echo [1] Change Power Plan.
  echo [2] Access Power Options.
  echo [3] Kill or Restart Process.
  echo [ ] To Quit.
  set inputNumber=
  set /P inputNumber=Type input: %=%
  goto inputNumberCleanseLoop
goto :101

  :102 REM Initial Loop Stage 2
    if /I "%inputNumber%"=="1" goto 111 REM Power Plan
    if /I "%inputNumber%"=="2" goto 121 REM Power Options
    if /I "%inputNumber%"=="3" goto 131 REM Restart Process Options
  goto 101

:111 REM Power Plan Stage 1
  set currentLoop=111
  cls
  echo Chose an option.
  echo.
  echo [1] For AMD Ryzen Balanced Power Plan
  echo [2] For Power Saver Power Plan
  echo [3-9] To Go Back.
  echo [ ] To Quit.

  set inputNumber=
  set /P inputNumber=Type input: %=%
  goto inputNumberCleanseLoop
goto 101

  :112 REM Power Plan Stage 2
    if /I "%inputNumber%"=="1" (
      C:\Windows\System32\powercfg.exe /setactive 9897998c-92de-4669-853f-b7cd3ecb2790
      cls
      echo AMD Ryzen Balanced Power Plan is Now Active.
      echo.
      timeout /T 3
    )
    if /I "%inputNumber%"=="2" (
      C:\Windows\System32\powercfg.exe /setactive a1841308-3541-4fab-bc81-f71556f20b4a
      cls
      echo Power Saving Power Plan is Now Active
      echo.
      timeout /T 3
    )
    goto 101



:121 REM Power Options Stage 1
  set currentLoop=121
  cls
  echo Chose an option
  echo.
  echo [1] To Lock Windows.
  echo [2] To Shutdown Windows.
  echo [3] To Hibernate Windows.
  echo [4] To Restart Windows.
  echo [5-9] To Go Back.
  echo [ ] To Quit.

  set inputNumber=
  set /P inputNumber=Type input: %=%
  goto inputNumberCleanseLoop
goto 121

  :122 REM Power Options Stage 2
    if /I "%inputNumber%"=="1" (
      cls
      echo Locking.
      echo.
      timeout /T 2 /nobreak
      rundll32.exe user32.dll, LockWorkStation
      exit
    )
    if /I "%inputNumber%"=="2" (
      set var1=Shutdown
      set var2=s
      goto 123
    )
    if /I "%inputNumber%"=="3" (
      set var1=Hibernate
      set var2=h
      goto 123
    )
    if /I "%inputNumber%"=="4" (
      set var1=Restart
      set var2=r
      goto 123
    )
    goto 101

    :123 REM Power Options Stage 3
      set currentLoop=123
      cls
      echo %var1% in how long? [Seconds]
      echo.
      set inputNumber=
      set /P inputNumber=Type input: %=%
      goto inputNumberCleanseLoop
    goto 123

      :124
        if "%var2%"=="h" (
          echo Hibernating in %inputNumber% seconds.
          timeout /T %inputNumber% /nobreak
          REM This is needed because you can not time a Hibernate event in the Command Line. Fuck You Microsoft.
          shutdown /%var2%
        )
        shutdown /%var2% /t %inputNumber%
        echo.



:131
  set currentLoop=131
  cls
  echo Kill or Restart process?
  echo.
  echo [1] To Kill.
  echo [2] To Restart.
  echo [3] To Dropkick.
  echo [4] To Dropkick and Restart.
  echo [5-9] To Go Back.
  echo [ ] To Quit.

  set inputNumber=
  set /P inputNumber=Type input: %=%
  goto inputNumberCleanseLoop
goto 131

  :132
    if /I "%inputNumber%"=="1" (
      set var1=1
      set var2=Kill
      set var3=/im
      goto 133
    )
    if /I "%inputNumber%"=="2" (
      set var1=2
      set var2=Restart
      set var3=/im
      goto 133
    )
    if /I "%inputNumber%"=="3" (
      set var1=1
      set var2=Force Kill
      set var3=/f /im
      goto 133
    )
    if /I "%inputNumber%"=="4" (
      set var1=2
      set var2=Force Restart
      set var3=/f /im
      goto 133
    )
    goto 101

    :133
      set currentLoop=133
      cls
      echo What process would you like to %var2%

      set var4=
      set /P var4=Type input: %=%
      if "%var1%"=="1" (
        taskkill %var3% %var4%

        timeout /T 3 /nobreak
        goto 000
      )
      if "%var1%"=="2" (
        taskkill %var3% %var4%
        timeout /T 3 /nobreak
        start %var4%

        goto 000
      )
      goto 131


:001
  cls
  echo Quitting.
pause

:000
