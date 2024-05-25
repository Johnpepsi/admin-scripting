@echo off
Echo ------------------------------------------------------------------------------------------------------------
Echo For a more thorough cleaning. Run this with Admin access
Echo ------------------------------------------------------------------------------------------------------------
pause
del /s /f /q %USERPROFILE%\appdata\local\temp\*.*
"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -removedefinitions -dynamicsignatures
"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -SignatureUpdate
wuauclt.exe /updatenow
cleanmgr /verylowdisk
gpupdate /force
winget upgrade --all --include-unknown
Echo ------------------------------------------------------------------------------------------------------------
Echo ------------------------------------------------------------------------------------------------------------
Echo ------------------------------------------------------------------------------------------------------------
Echo PC will Restart in 30 seconds if no key is pressed
Echo ------------------------------------------------------------------------------------------------------------
Echo ------------------------------------------------------------------------------------------------------------
Echo ------------------------------------------------------------------------------------------------------------
Shutdown -r -f -t 30
pause
Shutdown -a
