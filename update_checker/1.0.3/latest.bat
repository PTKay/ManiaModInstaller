@echo off
cls
echo Version 1.2 is available for download!
echo -----------------------------------------
echo Changelog:
echo Added an auto updater (Thanks SuperSonic16!)
echo Made it even more user friendly, with a better GUI (?)
echo No more separate bats, everything is under the same bat file.
echo Automatically checks for backups. If none is found, it makes one automatically.
echo.
echo Download now?
set /p downloadupdate=(Y/N)
if /I "%downloadupdate%" EQU "Y" goto :update
if /I "%downloadupdate%" EQU "N" goto :proceed

:update
cls
echo Updating ManiaModInstaller...
echo Don't close this window!
powershell "($WebClient = New-Object System.Net.WebClient).DownloadFile('https://github.com/PTKickass/ManiaModInstaller/blob/master/update_checker/1.0.3/maniamodinstaller.7z?raw=true', 'maniamodinstaller/update.7z')"

maniamodinstaller\7z.exe x "maniamodinstaller\update.7z" -o"maniamodinstaller\update"

call maniamodinstaller\autoupdater.bat

:proceed
