@echo off
echo This will uninstall any mods you currently have installed.
echo Press any key if you want to proceed.
pause >nul
cls
echo Restoring Data.rsdk from Backup folder...
xcopy /s /y _rsdkbackup .\