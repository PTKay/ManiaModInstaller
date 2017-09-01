@echo off
color c
echo IF YOU ALREADY BACKED UP YOUR      
echo DATA.RSDK, DON'T DO IT AGAIN OR 
echo IT WILL OVERWRITE YOUR PREVIOUS
echo BACKUP! EXIT AND DON'T PRESS NOTHING!
echo ---------------------------------------
echo ---------------------------------------
echo If you haven't backed up your Data.rsdk though,
echo press any key to do it now.
pause >nul
color 07

cls
md _rsdkbackup
cls
echo Backing up Data.rsdk...
copy data.rsdk _rsdkbackup
md Mods