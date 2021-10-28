
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
