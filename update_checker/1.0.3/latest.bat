@echo off
cls
echo Version 1.0.4 is available for download!
echo -----------------------------------------
echo Download now?
set /p downloadupdate=(Y/N)
if /I "%downloadupdate%" EQU "Y" goto :update
if /I "%downloadupdate%" EQU "N" goto :proceed

:update
cls
echo Updating ManiaModInstaller...
echo Don't close this window!
powershell "($WebClient = New-Object System.Net.WebClient).DownloadFile('https://github.com/PTKickass/ManiaModInstaller/blob/master/update_checker/1.0.3/ManiaModInstaller.7z', 'ManiaModInstaller\maniamodinstaller.7z')"

maniamodinstaller\7z.exe x maniamodinstaller.7z -o"maniamodinstaller\update"

call maniamodinstaller\autoupdater.bat

