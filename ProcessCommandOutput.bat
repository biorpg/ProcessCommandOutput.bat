::+++++++++
@echo off
setlocal ENABLEDELAYEDEXPANSION
set /p "cmdp1=enter the output producing command: "
set /p "cmdp2=enter part of the processing command that precedes the output to be processed: "
set /p "cmdp3=and now the part of the command that comes after the output to be processed: "

rem for /R %%d in (.) do (
@echo on
cmd /c "for /f "usebackq" %%i in (`%cmdp1%`) do %cmdp2% %%i %cmdp3%"
pause
rem )
endlocal