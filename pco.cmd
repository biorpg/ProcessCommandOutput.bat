@echo off
setlocal ENABLEDELAYEDEXPANSION
echo This script is to work around window's shitty command piping limitations(this is easy in linux)
echo It will execute a given command using the output of another command.
echo 	for example enter a command like:
echo 		dir /s /b *.rar
echo 	then enter a command prefix like:
echo 		move /Y
echo 	and a command suffix like:
echo 		C:\rarfiles
echo 	This would run:
echo 		move /Y ^<file^>.rar C:\rarfiles
echo 	on every .rar file under your current directory.
echo Now you try...
pause
:start
echo enter the command that produces the output you want to process:
set /p "cmdp1= "
echo enter command prefix:
set /p "cmdp2= "
echo enter command suffix:
set /p "cmdp3= "
echo This will execute the following for loop:
<nul (set/p "_demo=	for /f "usebackq" %%i in (`%cmdp1%`) do %cmdp2% %%i %cmdp3%")

rem leaving this here so I remember not to do it this way:
rem echo for /f "usebackq" %%i in (`%cmdp1%`) do %cmdp2% %%i %cmdp3%

echo.
rem choice /M feed result into yet another command? y/N?
choice /M Proceed?

if ERRORLEVEL 2 (
echo starting over..
goto :start
)

if ERRORLEVEL 1 (
echo processing command, please wait..
goto :pco
)

:pco
cmd /c "for /f "usebackq" %%i in (`%cmdp1%`) do %cmdp2% %%i %cmdp3%"
pause
endlocal
exit /b

rem :pcoo
rem @echo on
rem cmd /c "for /f "usebackq" %%i in (`%cmdp4%`) do %cmdp2% %%i %cmdp3%"
rem pause
rem rem )
rem endlocal
rem exit /b
