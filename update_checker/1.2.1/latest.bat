@echo off
cls
echo Version 1.2.2 is available for download!
echo -----------------------------------------
echo Changelog:
echo Added RSDKPack.exe because I forgot to pack it in
echo.
echo Download now?
set /p downloadupdate=(Y/N)
if /I "%downloadupdate%" EQU "Y" goto :update
if /I "%downloadupdate%" EQU "N" goto :proceed

:update
cls
echo Updating ManiaModInstaller...
echo Don't close this window!
powershell "($WebClient = New-Object System.Net.WebClient).DownloadFile('https://github.com/PTKickass/ManiaModInstaller/blob/master/update_checker/1.2.1/maniamodinstaller.7z?raw=true', 'maniamodinstaller/update.7z')"

maniamodinstaller\7z.exe x "maniamodinstaller\update.7z" -o"maniamodinstaller\update"

call maniamodinstaller\autoupdater.bat

:proceed
