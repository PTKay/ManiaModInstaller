cls
echo There now is an proper Mod Loader available made my MainMemory.
echo.
echo Would you like to download it?
echo (This will also uninstall ManiaModInstaller and restore your Data.rsdk file)
set /p downloadupdate=(Y/N)
if /I "%downloadupdate%" EQU "Y" goto :update
if /I "%downloadupdate%" EQU "N" goto :proceed

:update
cls
echo Downloading Mania Mod Loader by MainMemory
echo Don't close this window!
powershell "($WebClient = New-Object System.Net.WebClient).DownloadFile('http://mm.reimuhakurei.net/misc/ManiaModLoader.7z', 'maniamodinstaller/update.7z')"

cls
echo Updating Pre-packaged mods to be compatible
echo with Mania Mod Loader...
echo Don't close this window!
powershell "($WebClient = New-Object System.Net.WebClient).DownloadFile('https://github.com/PTKickass/ManiaModInstaller/blob/master/update_checker/1.2.2/modsupdated.7z?raw=true', 'maniamodinstaller/mods.7z')"


maniamodinstaller\7z.exe x "maniamodinstaller\update.7z" -o"maniamodinstaller\update"
cls
maniamodinstaller\7z.exe x "maniamodinstaller\mods.7z" -o"maniamodinstaller\update"

cls
echo Installing Mania Mod Loader...
xcopy /s /y /h "ManiaModInstaller/update" .\
RD /S /Q "ManiaModInstaller/update"
del /q "maniamodinstaller\update.7z"

cls
echo Restoring Data.rsdk from Backup folder...
xcopy /s /y _rsdkbackup .\

cls
echo Uninstalling ManiaModInstaller
del /q "ManiaModInstaller.bat"
del /q "ModInstaller_Changelog.txt"
del /q "ModInstaller_Readme.txt"
del /q "RSDKPack.exe"
del /q "data.txt"
del /q "data.xml"

cls
echo Thanks for using ManiaModInstaller!
echo Mania Mod Loader will now open...
echo.
echo Press any key to finish uninstallation
pause >nul

RD /S /Q "_rsdkbackup"

start ManiaModManager.exe

RD /S /Q "ManiaModInstaller"

:proceed
