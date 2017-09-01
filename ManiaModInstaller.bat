@echo off
cls
::Checks if Data.rsdk exists
if not exist "Data.rsdk" (
echo ERROR: Could not detect Data.rsdk!
echo -----------------------------------
echo Please copy ManiaModInstaller to the
echo Sonic Mania folder, where SonicMania.exe
echo is located.
pause >nul
goto exit
)


:Gets rid of previous instalation files
if exist BackupRSDK.bat (delete /q BackupRSDK.bat)
if exist UninstallMods.bat (delete /q uninstallmods.bat)
if exist updatefilelist.bat (delete /q updatefilelist.bat)

::Runs Update File List.bat if Data.txt doesn't exist
::if not exist "Data.txt" (call "ManiaModInstaller\UpdateFileList.bat")

::Runs UpdateFileList.bat everytime the program launches
del /q data.txt
call "ManiaModInstaller\UpdateFileList.bat"

::updates MMI
call "ManiaModInstaller\MMIUpdater.bat"


md _rsdkbackup
cls
echo Backing up Data.rsdk...
if not exist "_rsdkbackup\data.rsdk" (copy data.rsdk _rsdkbackup)


:menu
cls
echo Sonic Mania Mod Installer v1.2
echo By PTKickass (with help from SuperSonic16)
echo ------------------------------------------
echo 		Main Menu
echo ------------------------------------------
echo Please select an option:
echo.
echo 1 - Install Mods
echo 2 - Uninstall Mods
echo 3 - Run Sonic Mania
echo 4 - Exit Mania Mod Installer
echo ------------------------------------------
set /p menu=
if /I "%menu%" EQU "1" goto :install
if /I "%menu%" EQU "2" goto :uninstall
if /I "%menu%" EQU "3" goto :run_game
if /I "%menu%" EQU "4" goto :exit 
goto :menu_error

:menu_error
cls
echo Sonic Mania Mod Installer v1.2
echo By PTKickass (with help from SuperSonic16)
echo ------------------------------------------
echo 		Main Menu
echo ------------------------------------------
echo Please select an option:
echo.
echo 1 - Install Mods
echo 2 - Uninstall Mods
echo 3 - Run Sonic Mania
echo 4 - Exit Mania Mod Installer
echo ------------------------------------------
echo Invalid option!
set /p menu=
if /I "%menu%" EQU "1" goto :install
if /I "%menu%" EQU "2" goto :uninstall
if /I "%menu%" EQU "3" goto :run_game
if /I "%menu%" EQU "4" goto :exit 
goto :menu_error

:install
::Extracts Data.rsdk
md Data
attrib +h Data /s /d
del /q data.xml
cls
echo Sonic Mania Mod Installer v1.2
echo By PTKickass (with help from SuperSonic16)
echo ------------------------------------------
echo Extracting game content. This may take a while...
echo Do not close this window until extraction finishes.
RsdkPack.exe Data.rsdk >nul
cls


::Mod Instalation part
cd Mods
cls
echo Sonic Mania Mod Installer v1.2
echo By PTKickass (with help from SuperSonic16)
echo ------------------------------------------
echo Currently available mods:
echo.
dir /ad /b
echo.
set /p mod1=Select one mod to install (type it's name)
set /p mod2=Select a second mod to install (if none, leave this blank)
set /p mod3=Select a third mod to install (if none, leave this blank)
cls
md mod
xcopy /s /y /h %mod1% mod
xcopy /s /y /h %mod2% mod
xcopy /s /y /h %mod3% mod
cd ..
xcopy /s /y /h "Mods\mod" Data
rd /s /q "mods\mod"

::Repacks the Data.rsdk file
cls
echo Sonic Mania Mod Installer v1.2
echo By PTKickass (with help from SuperSonic16)
echo ------------------------------------------
echo Installing mods and repacking game content. This may take a while...
echo Do not close this window until installation finishes.
RsdkPack.exe Data >nul
cls

::Enabling these parameters allows you to prompt the user if they want to keep the extracted files from data.rsdk
::echo Keep extracted files?
::RD /s Data

::Disabling this parameter disables deletion of the Data folder
echo Sonic Mania Mod Installer v1.2
echo By PTKickass (with help from SuperSonic16)
echo ------------------------------------------
echo Deleting leftovers...
RD /S /Q Data
RD /S /Q "Mods/Data"

echo Mod(s) installed!
cls
echo Sonic Mania Mod Installer v1.2
echo By PTKickass (with help from SuperSonic16)
echo ------------------------------------------
echo Mod(s) installed!
echo.
echo Open Sonic Mania?
set /p opengame=(Y/N)
if /I "%opengame%" EQU "Y" goto :run_game
if /I "%opengame%" EQU "N" goto :menu


:run_game
start steam://rungameid/584400
goto :exit

:uninstall
cls
echo Sonic Mania Mod Installer v1.2
echo By PTKickass (with help from SuperSonic16)
echo ------------------------------------------
echo This will uninstall any mods you currently have installed.
echo Are you sure you want to do this?
set /p uninstall=(Y/N)
if /I "%uninstall%" EQU "Y" goto :uninstall_true
if /I "%uninstall%" EQU "N" goto :menu

:uninstall_true
cls
echo Restoring Data.rsdk from Backup folder...
xcopy /s /y _rsdkbackup .\

echo Mod(s) uninstalled!
cls
echo Sonic Mania Mod Installer v1.2
echo By PTKickass (with help from SuperSonic16)
echo ------------------------------------------
echo Mod(s) uninstalled!
echo.
echo Open Sonic Mania?
set /p opengame=(Y/N)
if /I "%opengame%" EQU "Y" goto :run_game
if /I "%opengame%" EQU "N" goto :menu



:exit