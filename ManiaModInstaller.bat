@echo off
::Checks if Data.rsdk and RsdkPack.exe exists
if not exist "Data.rsdk" (
echo Data.rsdk does not exist!
echo Make sure you put all the files from ManiaModInstaller into your "Sonic Mania" Folder
echo Press any key to close this window
pause >nul
goto exit
)

if not exist "RsdkPack.exe" (
echo RsdkPack.exe does not exist!
echo This is required to extract and edit the archive
echo Press any key to close this window
pause >nul
goto exit
)

::Updates the file list
call UpdateFileList.bat


::Extracts Data.rsdk
echo Extracting game content. This may take a while...
echo Do not close this window until extraction finishes.
RsdkPack.exe Data.rsdk >nul
cls


::Mod Instalation part
cd Mods
cls
dir /ad /b
set /p mod1=Select one mod to install (type it's name)
set /p mod2=Select a second mod to install (if none, leave this blank)
set /p mod3=Select a third mod to install (if none, leave this blank)
cls
md mod
xcopy /s /y %mod1% mod
xcopy /s /y %mod2% mod
xcopy /s /y %mod3% mod
cd ..
xcopy /s /y "Mods\mod" Data
rd /s /q "mods\mod"

::Repacks the Data.rsdk file
echo Installing mods and repacking game content. This may take a while...
echo Do not close this window until installation finishes.
RsdkPack.exe Data >nul
cls

::Enabling these parameters allows you to prompt the user if they want to keep the extracted files from data.rsdk
::echo Keep extracted files?
::RD /s Data

::Disabling this parameter disables deletion of the Data folder
echo Deleting leftovers...
RD /S /Q Data
RD /S /Q "Mods/Data"
pause

cls
echo Mod(s) installed! Open the game to see if it worked.
echo -----------------------------------------------------
echo If you want, you can go back to your original installation
echo by running "UninstallMods.bat" from your game folder!
echo Press any key to close this window
pause >nul
:exit