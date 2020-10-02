::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCqDJGmW+0YlKw9dWg2WJSuUMJgZ1NfEyOOTnl4eRusvbMLQ07CyLekB60ypZpU/32pOpO40KQhkWSWlYQExsUBLtWunec6fvG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCqDJGmW+0YlKw9dWg2WJSuUMJgZ1NfEyOOTnl4eRusvbMLQ07CyLekB60ypZpU/32pOpO40KQhkL1z7IF1k52taswQ=
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@ECHO off
title Windows Batchscript - Adrian
GOTO :main

REM Documentation
REM ----------------------------------------------------------------------------


    REM ------------------------------------------------------------------------
    REM Variables
    REM ------------------------------------------------------------------------
    REM camelCase
    REM ------------------------------------------------------------------------
    REM Main Variables:
    REM ------------------------------------------------------------------------
    REM currentFunction: defines the "parent" function that will be returned to on bad user entry
    REM nextFunction: defines the next function to be called if command_numerical_check is successful
    REM ------------------------------------------------------------------------


    REM "Namespaces"
    REM ------------------------------------------------------------------------
    REM PascalCase
    REM ------------------------------------------------------------------------
    REM All functions are to be located within a namespace
    REM ------------------------------------------------------------------------
    REM Namespace names:
    REM ------------------------------------------------------------------------
    REM CommandParse: Parse command and confirmations
    REM 
    REM TargetProcess_main: Target Process
    REM AffinityAlloc: Affinity Allocation (Temp)
    REM PowerOptions_main: Access Power Options.
    REM PowerPlan_main: Change Power Plan.
    REM ProcessKill_main: Kill or Restart Process.
    REM CmdAsSystem_main: Start CMD as System.
    REM ClearEventLog_main: To Clear Event Logs.
    REM HddSpinDown_main: Spin down drives.
    REM NetworkPing_main: Ping.


    REM "Functions"
    REM ------------------------------------------------------------------------
    REM snake_case
    REM ------------------------------------------------------------------------
    REM Main Functions:
    REM ------------------------------------------------------------------------
    REM command_numerical_check: check if user entered a number on option choice
    REM command_general_check: check if user entered a general command
    REM command_confirm_request: get user to confirm the request they made
    REM command_confirm_request_handler: check user confirmed in proper way depending on strictness
    REM ------------------------------------------------------------------------


REM ----------------------------------------------------------------------------



REM ----------------------------------------------------------------------------
REM Command Handlers
REM ----------------------------------------------------------------------------

REM Call this if you just want to check the command
:command_confirm_request_handler
REM IF the cnfr mMode is easy and user enters nothing, go to userReq
IF "%cnfrmMode%"=="easy" (
    IF "%userInput%"=="" (
       GOTO :%userReq%
    )
)

REM IF the cnfrmMode is normal and user enters \cnfrm, go to userReq
IF "%cnfrmMode%"=="norm" (
    IF "%userInput%"=="\cnfrm" (
       GOTO :%userReq%
    )
)

REM In any case, if the user repeats the command, follow through with it too
IF "%userInput%"=="%userReq%" (
    GOTO :%userReq%
)
IF "%userInput%"=="%userReqL%" (
    GOTO :%userReq%
)
GOTO %currentFunction%


REM Call this to show a "full" confirmation dialog
:command_confirm_request
CLS
ECHO [%userReqWordy%] Request
ECHO.
IF "%userReq%"=="\z" (
    REM Easy confirm IF the only thing the user wants to do is go back, else
    REM ------------------------------------------------------------------------
    REM Can/will add more if statements to support the easy confirmation of other
    REM commands
    REM ------------------------------------------------------------------------
    ECHO [Enter] to confirm or repeat command [%userReqL%]
    ECHO.
    ECHO [%userReq%] Command Shortcut
    ECHO.
    SET userInput=
    SET cnfrmMode=easy
    SET /P userInput=Type input:
    GOTO :command_confirm_request_handler
) ELSE (
    REM Normal comfirm in the case of any other command
    ECHO [\cnfrm] to confirm or repeat command [%userReqL%]
    ECHO.
    ECHO [%userReq%] Command Shortcut
    ECHO.
    SET userInput=
    SET cnfrmMode=norm
    REM use norm for future-proofing of very consequential commands using "hard"
    SET /P userInput=Type input:
    GOTO :command_confirm_request_handler
)
GOTO :command_confirm_request



:command_general_check
REM ----------------------------------------------------------------------------
REM 
REM ----------------------------------------------------------------------------
IF "%userInput%"=="\q" (
    SET userReq=\q
    SET userReqL=\quit
    SET userReqWordy=Quit
    GOTO :command_confirm_request
)
IF "%userInput%"=="\quit" (
    SET userReq=\q
    SET userReqL=\quit
    SET userReqWordy=Quit
    GOTO :command_confirm_request
)
REM ----------------------------------------------------------------------------
REM 
REM ----------------------------------------------------------------------------
IF "%userInput%"=="\fq" (
    SET userReq=\fq
    SET userReqL=\forcequit
    SET userReqWordy=Force Quit
    GOTO :command_confirm_request
)
IF "%userInput%"=="\forcequit" (
    SET userReq=\fq
    SET userReqL=\forcequit
    SET userReqWordy=Force Quit
    GOTO :command_confirm_request
)
REM ----------------------------------------------------------------------------
REM 
REM ----------------------------------------------------------------------------
IF "%userInput%"=="\z" (
    SET userReq=\z
    SET userReqL=\back
    SET userReqWordy=Back
    GOTO :command_confirm_request
)
IF "%userInput%"=="\back" (
    SET userReq=\z
    SET userReqL=\back
    SET userReqWordy=Back
    GOTO :command_confirm_request
)
GOTO :eof


:command_numerical_check
REM ----------------------------------------------------------------------------
REM NOTE: I think this is a redundant check at this point
REM ----------------------------------------------------------------------------
REM This block checks IF the userInput was numerical, IF invalid goes to currentFunction, IF valid then allows to go to nextFunction
SET "var="&for /f "delims=0123456789" %%i in ("%userInput%") do SET var=%%i
IF defined var (
    CLS
    GOTO %currentFunction%
)
GOTO %nextFunction%



REM ----------------------------------------------------------------------------
REM main
REM ----------------------------------------------------------------------------



:main
SET currentFunction=main
CLS
ECHO What would you like to do?
ECHO.
ECHO [1] Target Process
ECHO [2] Affinity Allocation (Temp)
ECHO [3] Access Power Options.
ECHO [4] Change Power Plan.
ECHO [5] Kill or Restart Process.
ECHO [6] Start CMD as System.
ECHO [7] To Clear Event Logs.
ECHO [8] Spin down drives.
ECHO [9] Ping.
ECHO [\q] To Quit.
SET userInput=
SET /P userInput=Type input: %=%
CALL :command_general_check
SET nextFunction=main_option_selection
GOTO :command_numerical_check


:main_option_selection
IF /I "%userInput%"=="1" GOTO :TargetProcess_main
IF /I "%userInput%"=="2" GOTO :AffinityAlloc_main
IF /I "%userInput%"=="3" GOTO :PowerOptions_main
IF /I "%userInput%"=="4" GOTO :PowerPlan_main
IF /I "%userInput%"=="5" GOTO :ProcessKill_main
IF /I "%userInput%"=="6" GOTO :CmdAsSystem_main
IF /I "%userInput%"=="7" GOTO :ClearEventLog_main
IF /I "%userInput%"=="8" GOTO :HddSpinDown_main
IF /I "%userInput%"=="9" GOTO :NetworkPing_main
GOTO :main



REM ----------------------------------------------------------------------------
REM TargetProcess
REM ----------------------------------------------------------------------------



:TargetProcess_main
SET currentFunction=TargetProcess_main
CLS
ECHO [Hub ^> Target Process]
ECHO.
ECHO This will SET the given process to the last 8 Threads
ECHO.
ECHO.
IF /I "%processName%" NEQ "" (
    ECHO Process name is currently SET to [%processName%]
    ECHO.
    ECHO.
)
ECHO [1] Change process name.
ECHO [1] SET Process Affinity.
ECHO [3] View all processes.
ECHO [4] View all processes matching executable name
ECHO [\z] To Go Back.
ECHO [\q] To Quit.
SET userInput=
SET /P userInput=Type input: %=%
CALL :command_general_check
SET nextFunction=TargetProcess_main_option_selection
GOTO :command_numerical_check

:TargetProcess_main_option_selection
IF /I "%userInput%"=="1" GOTO TargetProcess_change_process
IF /I "%userInput%"=="2" GOTO TargetProcess_set_process_affinity
IF /I "%userInput%"=="3" GOTO TargetProcess_process_list
IF /I "%userInput%"=="4" GOTO TargetProcess_matching_process_list
GOTO :main

:TargetProcess_change_process
CLS
ECHO [Hub ^> Target Process ^> Change Process Name]
ECHO.
ECHO.
ECHO Don't add the executable [.exe] extension.
SET processName=
SET /P processName=Type input: %=%
GOTO :TargetProcess_main

:TargetProcess_set_process_affinity
CLS
SET processNameReady = %processName%
REM powershell -Command "Start-Process powershell \"-ExecutionPolicy Bypass -NoProfile -Command -NoExit `\"ForEach($PROCESS in GET-PROCESS "atom") { $PROCESS.ProcessorAffinity=65280}`\"\" -Verb RunAs"
powershell -Command "ForEach($PROCESS in GET-PROCESS \"%processName%\") { $PROCESS.ProcessorAffinity=65280}"
REM powershell -Command "Start-Process powershell \"-ExecutionPolicy Bypass -NoProfile -NoExit -Command `\"cd C:\PSTools\; .\psexec.exe -s cmd.exe /k "%psExecDrive%"`\"\" -Verb RunAs"
PAUSE
GOTO :TargetProcess_main

:TargetProcess_process_list
CLS
ECHO [All Processes]
ECHO .
ECHO .
ECHO .
TASKLIST
ECHO .
ECHO .
ECHO .
ECHO [All Processes]
PAUSE
GOTO %currentFunction%

:TargetProcess_matching_process_list
CLS
IF "%processName%"=="" GOTO TargetProcess_process_name_not_given
ECHO [Processes Matching Executable Name]
ECHO.
ECHO.
TASKLIST /FI "imagename eq %processName%.exe"
PAUSE
GOTO %currentFunction%

:TargetProcess_print_process_name
CLS
IF "%processName%"=="" GOTO TargetProcess_process_name_not_given
ECHO [User Given Process Name]
ECHO.
ECHO.
ECHO Process name set to [%processName%]
PAUSE
GOTO %currentFunction%

:TargetProcess_process_name_not_given
ECHO Process name was not given
PAUSE
GOTO %currentFunction%



REM ----------------------------------------------------------------------------
REM AffinityAlloc
REM ----------------------------------------------------------------------------



:AffinityAlloc_main
SET currentFunction=AffinityAlloc
CLS
ECHO Chose an option (Zen 8C16T only)
ECHO.
ECHO [1] All 16 Threads Default.
ECHO [2] Windows First CXX, Firefox Second CCX
ECHO [3] All Processes First CCX
ECHO [4] All Processes Second CCX
ECHO [5] Debloat first 15 Threads (Predetermined processes on last thread)
ECHO [6] Debloat refresh
ECHO [\z] To Go Back.
ECHO [\q] To Quit.
SET userInput=
SET /P userInput=Type input: %=%
CALL :command_general_check
SET nextFunction=AffinityAlloc_main_option_selection
GOTO :command_numerical_check

:AffinityAlloc_main_option_selection
IF /I "%userInput%"=="1" (
    SET pscriptname=Global All Affinity Default.ps1
    GOTO :AffinityAlloc_run_powershell_file
)
IF /I "%userInput%"=="2" (
    SET pscriptname=Windows+Firefox 8T-16T.ps1
    GOTO :AffinityAlloc_run_powershell_file
)
IF /I "%userInput%"=="3" (
    SET pscriptname=All Processes first 8 Threads.ps1
    GOTO :AffinityAlloc_run_powershell_file
)
IF /I "%userInput%"=="4" (
    SET pscriptname=All Processes last 8 Threads.ps1
    GOTO :AffinityAlloc_run_powershell_file
)
IF /I "%userInput%"=="5" (
    SET pscriptname=All Processes first 14 Threads, bloat last 2 Threads.ps1
    GOTO :AffinityAlloc_run_powershell_file
)
IF /I "%userInput%"=="6" (
    SET pscriptname=bloat last 2 Threads.ps1
    GOTO :AffinityAlloc_run_powershell_file
)
GOTO :AffinityAlloc_main_option_selection

REM https://stackoverflow.com/questions/7690994/running-a-command-as-administrator-using-powershell
REM Windows Firefox Affinity 16T dumboption
:AffinityAlloc_run_powershell_file 
SET currentFunction=AffinityAlloc_run_powershell_file
CLS
ECHO Opening Script.
ECHO.
REM THIS WILL BE REWRITTEN
REM SET scriptFileName=All Processes last 8 Threads
SET scriptFolderPath=E:\Productivity NVMe\__Git\script-kid\mirai-script\PowerShell
REM SET powershellScriptFileName=%scriptFileName%.ps1
powershell -Command "Start-Process powershell \"-ExecutionPolicy Bypass -NoProfile -Command `\"cd \`\"%scriptFolderPath%\`\"; & \`\".\%pscriptname%\`\"`\"\" -Verb RunAs"
GOTO :main



REM ----------------------------------------------------------------------------
REM PowerOptions
REM ----------------------------------------------------------------------------



:PowerOptions_main
SET currentFunction=PowerOptions_main
CLS
ECHO Chose an option
ECHO.
ECHO [1] To Lock Windows.
ECHO [2] To Shutdown Windows.
ECHO [3] To Hibernate Windows.
ECHO [4] To Restart Windows.
ECHO [\z] To Go Back.
ECHO [\q] To Quit.
SET userInput=
SET /P userInput=Type input: %=%
CALL :command_general_check
SET nextFunction=PowerOptions_main_option_selection
GOTO :command_numerical_check

:PowerOptions_main_option_selection
IF /I "%userInput%"=="1" (
    CLS
    ECHO Locking.
    ECHO.
    TIMEOUT /T 2 /nobreak
    rundll32.exe user32.dll, LockWorkStation
    EXIT
)
IF /I "%userInput%"=="2" (
    SET var1=Shutdown
    SET var2=s
    GOTO :PowerOptions_duration_selection
)
IF /I "%userInput%"=="3" (
    SET var1=Hibernate
    SET var2=h
    GOTO :PowerOptions_duration_selection
)
IF /I "%userInput%"=="4" (
    SET var1=Restart
    SET var2=r
    GOTO :PowerOptions_duration_selection
)
GOTO :PowerOptions_main_option_selection

:PowerOptions_duration_selection REM Power Options Stage 3
SET currentFunction=PowerOptions_duration_selection
CLS
ECHO %var1% in how long? [Seconds]
ECHO.
SET userInput=
SET /P userInput=Type input: %=%
CALL :command_general_check
SET nextFunction=PowerOptions_run_desired_powerdown
GOTO :command_numerical_check

:PowerOptions_run_desired_powerdown
REM If user wanted to hibernate, use timeout in Command Line because you can't run shutdown hibernate on timer. Fuck You Microsoft.
IF "%var2%"=="h" (
    ECHO Hibernating in %userInput% seconds.
    TIMEOUT /T %userInput% /nobreak
    shutdown /%var2%
	ECHO.
) ELSE (
    shutdown /%var2% /t %userInput%
	ECHO.
)
GOTO :main



REM ----------------------------------------------------------------------------
REM PowerPlan
REM ----------------------------------------------------------------------------



:PowerPlan_main
SET currentFunction=PowerPlan_main
CLS
ECHO Chose an option.
ECHO.
ECHO [1] For Balanced Power Plan
ECHO [2] For Balanced Power Plan - 0% CPU 24/7
ECHO [3] For Balanced Power Plan - 100% CPU 24/7
ECHO [4] For AMD Ryzen Balanced Power Plan
ECHO [5] For Power Saver Power Plan
ECHO [\z] To Go Back.
ECHO [\q] To Quit.
SET userInput=
SET /P userInput=Type input: %=%
CALL :command_general_check
SET nextFunction=PowerPlan_select_plan
GOTO :command_numerical_check

:PowerPlan_select_plan
IF /I "%userInput%"=="1" (
    C:\Windows\System32\powercfg.exe /SETactive 381b4222-f694-41f0-9685-ff5bb260df2e
    CLS
    ECHO Power plan:
    ECHO.
    ECHO   Balanced Power Plan is Now Active.
    ECHO.
    ECHO has now been SET.
    ECHO.
    TIMEOUT /T 3
    GOTO :main
)
IF /I "%userInput%"=="2" (
    C:\Windows\System32\powercfg.exe /SETactive 5a136054-0165-48c0-b4f9-9985550e3a6f
    CLS
    ECHO Power plan:
    ECHO.
    ECHO   Balanced Power Plan - 0% CPU 24/7
    ECHO.
    ECHO has now been SET.
    ECHO.
    TIMEOUT /T 3
    GOTO :main
)
IF /I "%userInput%"=="3" (
    C:\Windows\System32\powercfg.exe /SETactive 26954c3d-b0ce-43db-b9e0-0550937a494f
    CLS
    ECHO Power plan:
    ECHO.
    ECHO   Balanced Power Plan - 100% CPU 24/7
    ECHO.
    ECHO has now been SET.
    ECHO.
    TIMEOUT /T 3
    GOTO :main
)
IF /I "%userInput%"=="4" (
    C:\Windows\System32\powercfg.exe /SETactive a1841308-3541-4fab-bc81-f71556f20b4a
    CLS
    ECHO Power plan:
    ECHO.
    ECHO   Power Saving Power Plan is Now Active
    ECHO.
    ECHO has now been SET.
    ECHO.
    TIMEOUT /T 3
    GOTO :main
)
IF /I "%userInput%"=="5" (
    C:\Windows\System32\powercfg.exe /SETactive 26954c3d-b0ce-43db-b9e0-0550937a494f
    CLS
    ECHO Power plan:
    ECHO.
    ECHO   Balanced Power Plan - 100% CPU 24/7 is Now Active.
    ECHO.
    ECHO has now been SET.
    ECHO.
    TIMEOUT /T 3
    GOTO :main
)
GOTO :PowerPlan_select_plan



REM ----------------------------------------------------------------------------
REM ProcessKill
REM ----------------------------------------------------------------------------



:ProcessKill_main
SET currentFunction=ProcessKill_main
CLS
ECHO Kill or Restart process?
ECHO.
ECHO [1] To Kill.
ECHO [2] To Restart.
ECHO [3] To Dropkick.
ECHO [4] To Dropkick and Restart.
ECHO [\z] To Go Back.
ECHO [\q] To Quit.
SET userInput=
SET /P userInput=Type input: %=%
CALL :command_general_check
SET nextFunction=ProcessKill_mode_selection
GOTO :command_numerical_check

:ProcessKill_mode_selection
IF /I "%userInput%"=="1" (
    SET processRestart=n
    SET processMode=Kill
    SET processCommand=/im
    GOTO :ProcessKill_process_selection
)
IF /I "%userInput%"=="2" (
    SET processRestart=y
    SET processMode=Restart
    SET processCommand=/im
    GOTO :ProcessKill_process_selection
)
IF /I "%userInput%"=="3" (
    SET processRestart=n
    SET processMode=Force Kill
    SET processCommand=/f /im
    GOTO :ProcessKill_process_selection
)
IF /I "%userInput%"=="4" (
    SET processRestart=y
    SET processMode=Force Restart
    SET processCommand=/f /im
    GOTO :ProcessKill_process_selection
)
GOTO :ProcessKill_mode_selection

:ProcessKill_process_selection
SET currentFunction=ProcessKill_process_selection
CLS
ECHO What process would you like to %processMode%
SET userInput=
SET /P userInput=Type input: %=%
IF "%processRestart%"=="n" (
    taskkill %processCommand% %userInput%
    TIMEOUT /T 3 /nobreak
    GOTO :main
)
IF "%processRestart%"=="y" (
    taskkill %processCommand% %userInput%
    TIMEOUT /T 3 /nobreak
    start %userInput%
    GOTO :main
)
GOTO :ProcessKill_process_selection



REM ----------------------------------------------------------------------------
REM CmdAsSystem
REM ----------------------------------------------------------------------------



REM PSExec Elevate To System
:CmdAsSystem_main
SET currentFunction=CmdAsSystem_main
CLS
ECHO Enter desired CMD Drive Location Letter.
ECHO.
ECHO [\z] To Go Back.
ECHO [\q] To Quit.
SET userInput=
SET /P userInput=Type input: %=%
CALL :command_general_check
SET psExecDrive=%userInput%:
REM Appends : to the drive the user wants to go to
powershell -Command "Start-Process powershell \"-ExecutionPolicy Bypass -NoProfile -NoExit -Command `\"cd C:\PSTools\; .\psexec.exe -s cmd.exe /k "%psExecDrive%"`\"\" -Verb RunAs"
REM Start PowerShell which starts another PowerShell as admin, running the command `\"cd C:\PSTools\; .\psexec.exe -s cmd.exe /k "%psExecDrive%"`
REM This SETs the CD to the C location of PSTools, then executres psexec using .\psexec.exe because otherwise PowerShell throws a fit about trust
REM Finally the psexec opens a CMD window with the directory paramater using the variable %psExecDrive% and /k
GOTO :main

:ClearEventLog_main
SET currentFunction=ClearEventLog_main
CLS
ECHO This will clear all event logs
ECHO.
ECHO As of now you may need to restart the script as admin to clear properly
ECHO.
ECHO [\cnfrm] To confirm.
ECHO [\z] To Go Back.
ECHO [\q] To Quit.
SET userInput=
SET /P userInput=Type input: %=%
CALL :command_general_check
SET cnfrmMode=
SET userReq=ClearEventLog_run
CALL :command_confirm_request_handler

:ClearEventLog_run
IF /I "%userInput%"=="\cnfrm" (
    powershell -Command "$logs = Get-EventLog -List | ForEach-Object {$_.Log}; $logs | ForEach-Object {Clear-EventLog -LogName $_ }; Get-EventLog -list"
    REM powershell -Command "Start-Process powershell \"-ExecutionPolicy Bypass -NoProfile -NoExit -Command `\"$logs = Get-EventLog -List | ForEach-Object {$_.Log}; $logs | ForEach-Object {Clear-EventLog -LogName $_ }; Get-EventLog -list"`\"\" -Verb RunAs"
    REM Not working admin versiom
    PAUSE
    GOTO :main
)
PAUSE
GOTO :main



REM ----------------------------------------------------------------------------
REM HddSpinDown
REM ----------------------------------------------------------------------------



:HddSpinDown_main
SET currentFunction=HddSpinDown_main
CLS
ECHO Which drive to spin down? (Adi PC only)
ECHO.
ECHO [X] Digital Hoarding HDD
ECHO [Z] Documents and Productivity HDD
ECHO [\z] To Go Back.
ECHO [\q] To Quit.
SET userInput=
SET /P userInput=Type input: %=%
CALL :command_general_check
IF /I "%userInput%"=="X" (
    "D:\Programs\HDDScan\HDDScan.exe" "\\?\scsi#disk&ven_wdc&prod_wd10ezex-60zf5a0#5&2c4dbacb&0&030000#{53f56307-b6bf-11d0-94f2-00a0c91efb8b}" -Z
    GOTO :main
)
IF /I "%userInput%"=="Z" (
    "D:\Programs\HDDScan\HDDScan.exe" "\\?\scsi#disk&ven_&prod_st2000dm006-2dm1#5&2c4dbacb&0&010000#{53f56307-b6bf-11d0-94f2-00a0c91efb8b}" -Z
    GOTO :main
)
GOTO :HddSpinDown_main



REM ----------------------------------------------------------------------------
REM NetworkPing
REM ----------------------------------------------------------------------------



:NetworkPing_main
SET currentFunction=NetworkPing_main
CLS
ECHO Do you want to log pings to console or file?
ECHO.
ECHO [1] Console
ECHO [2] File
ECHO [\z] To Go Back.
ECHO [\q] To Quit.
SET userInput=
SET /P userInput=Type input: %=%
CALL :command_general_check
IF /I "%userInput%"=="1" (
    SET pingMode=console
    CALL :NetworkPing_main_option_selection
	IF not DEFINED pingCount (goto :NetworkPing_ping_console_endless) else (goto :NetworkPing_ping_console_iterated)
)
IF /I "%userInput%"=="2" (
    SET pingMode=file
    CALL :NetworkPing_main_option_selection
	ECHO [Enter] for defaults
    ECHO.
    ECHO Set Save Filename:
    SET fileName=
    SET /P fileName=
    CALL :command_general_check
    IF not DEFINED fileName SET "fileName=AiMirai-%~n0-%pingAddress%"
    IF not DEFINED pingCount (goto :NetworkPing_ping_tofile_endless) else (goto :NetworkPing_ping_tofile_iterated)
    CLS
)
GOTO :NetworkPing_main

:NetworkPing_main_option_selection
SET currentFunction=NetworkPing_main_option_selection
REM ----------------------------------------------------------------------------
REM pingAddress
REM ----------------------------------------------------------------------------
CLS
ECHO Set Ping Address:
ECHO.
ECHO [Enter] for defaults
ECHO [\z] To Go Back.
ECHO [\q] To Quit.
SET userInput=
SET /P userInput=Type input: %=%
CALL :command_general_check
SET pingAddress=%userInput%
IF not DEFINED pingAddress SET "pingAddress=1.1.1.1"
REM ----------------------------------------------------------------------------
REM pingSize
REM ----------------------------------------------------------------------------
CLS
ECHO Set Ping Size (Bytes):
ECHO.
ECHO [Enter] for defaults
ECHO [\z] To Go Back.
ECHO [\q] To Quit.
SET userInput=
SET /P userInput=Type input: %=%
CALL :command_general_check
SET pingSize=%userInput%
IF not DEFINED pingSize SET "pingSize=32"
REM ----------------------------------------------------------------------------
REM pingCount
REM ----------------------------------------------------------------------------
CLS
ECHO Set Ping Count:
ECHO.
ECHO [Enter] for defaults
ECHO [\z] To Go Back.
ECHO [\q] To Quit.
SET userInput=
SET /P userInput=Type input: %=%
CALL :command_general_check
SET pingCount=%userInput%
CLS
)

REM NOTE: Have to get a way to escape these loops and auto-cancel the iterated ones and go back into script

:NetworkPing_ping_console_iterated
ping -t %pingAddress% -l %pingSize%|cmd /q /v /c "(pause&pause)>nul & for /l %%a in (1, 1, %pingCount%) do (set /p "data=" && echo(!date! %tab% !time! %tab% !data! )&ping -n 2 localhost>nul"
exit

:NetworkPing_ping_console_endless
ping -t %pingAddress% -l %pingSize%|cmd /q /v /c "(pause&pause)>nul & for /l %%a in () do (set /p "data=" && echo(!time! !data!)&ping -n 2 localhost>nul"
exit

:NetworkPing_ping_tofile_iterated
ping -t %pingAddress% -l %pingSize%|cmd /q /v /c "(pause&pause)>nul & for /l %%a in (1, 1, %pingCount%) do (set /p "data=" && echo(!date! %tab% !time! %tab% !data! )&ping -n 2 localhost>nul" >> %fileName%.txt
exit

:NetworkPing_ping_tofile_endless
ping -t %pingAddress% -l %pingSize%|cmd /q /v /c "(pause&pause)>nul & for /l %%a in () do (set /p "data=" && echo(!date! %tab% !time! %tab% !data! )&ping -n 2 localhost>nul" >> %fileName%.txt
exit



REM ----------------------------------------------------------------------------
REM 
REM ----------------------------------------------------------------------------



:\z
ECHO confirmed Back
REM SET /a prevLoop=%currentFunction%-1
REM GOTO %prevLoop%
REM Not using the -1 as this goes back to non-existing loops, instead go to beginning loop
REM TODO: Instead of blindly going back to main, maybe keep a log history of user-called functions?
REM but that'll get messy to code and UX will probably suck
GOTO :main
PAUSE

:\q
CLS
ECHO Quitting.
EXIT

:\fq
EXIT


ECHO FUCK
PAUSE
