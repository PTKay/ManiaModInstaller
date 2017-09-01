@echo off
del /q latest.bat
cls
echo Checking for updates...
powershell "($WebClient = New-Object System.Net.WebClient).DownloadFile('https://github.com/PTKickass/ManiaModInstaller/blob/master/update_checker/1.2.1/latest.bat?raw=true', 'ManiaModInstaller/latest.bat')"
call maniamodinstaller\latest.bat
del /q maniamodinstaller\latest.bat