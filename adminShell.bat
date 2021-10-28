:::::::::::::::::::::::::::::::::::::::::
:: Automatically check & get admin rights
:::::::::::::::::::::::::::::::::::::::::
@echo off
CLS 
ECHO.
ECHO =============================
ECHO Running Admin shell
ECHO =============================

:checkPrivileges 
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges ) 

:getPrivileges 
if '%1'=='ELEV' (shift & goto gotPrivileges)  
ECHO. 
ECHO **************************************
ECHO Getting Adming rights 
ECHO **************************************

setlocal DisableDelayedExpansion
set "batchPath=%~0"
setlocal EnableDelayedExpansion
ECHO Set UAC = CreateObject^("Shell.Application"^) > "%temp%\OEgetPrivileges.vbs" 
ECHO UAC.ShellExecute "!batchPath!", "ELEV", "", "runas", 1 >> "%temp%\OEgetPrivileges.vbs" 
"%temp%\OEgetPrivileges.vbs" 
exit /B 

:gotPrivileges 
::::::::::::::::::::::::::::
ECHO  START install process
::::::::::::::::::::::::::::
setlocal & pushd .
echo %~dp0
cd /d %~dp0


set list=1000 2000 3000 4000 5000 6000 7000 8000 9000 TenThousand

SET /P yesno=User input questionaire Continue?? [Y/N]:
IF "%yesno%"=="y" GOTO Confirmation
IF "%yesno%"=="Y" GOTO Confirmation
IF "%yesno%"=="n" GOTO End
IF "%yesno%"=="N" GOTO End

:Confirmation

ECHO User selected Y/y


(for %%a in (%list%) do (
   echo  Do something based on the list item %%a
   echo/
pause
))

echo After loop finished, do something else
pause


GOTO EOF
:End
ECHO User selected N/n, exiting
rem append to file
rem echo someText > overwrite
rem break >log.txt to clear file

ECHO User selected N/n, exiting >> log.txt

TIMEOUT 3 >nul

:EOF
exit
