@echo off

SETLOCAL
:PROMPT

ECHO.

SET /P AREYOUSURE="This will kill all UiPath processes in your session. Unsaved work will be lost. Do you want to continue? (Y/[N])? "
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END

ECHO.
ECHO START
ECHO.

ECHO 1. Changing environment variable value
SETX ROUTE_TO_UIPATH "%cd%\RobotBase\Data" > nul
ECHO.
ECHO 2. Killing UiPath processes
ECHO.
TASKKILL /F /FI "USERNAME eq %USERNAME%" /FI "IMAGENAME eq UiPath*" > nul

ECHO.
ECHO DONE
ECHO.
ECHO.

PAUSE
:END