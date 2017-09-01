@echo off
cls
echo Updating ManiaModInstaller...
xcopy /s /y /h "ManiaModInstaller/update" .\
RD /S /Q "ManiaModInstaller/update"
del /q "maniamodinstaller\update.7z"

cls
echo Update finished!
call ManiaModInstaller.bat