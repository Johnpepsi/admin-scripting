@echo off
cd C:%HomePath%\Pictures\Screenshots

echo Are you sure you want to delete all PNG files? (Y/N)
set /p choice=

if /i "%choice%"=="Y" (
    del *.png
    echo Files deleted.
) else (
    echo Operation canceled.
)
pause
