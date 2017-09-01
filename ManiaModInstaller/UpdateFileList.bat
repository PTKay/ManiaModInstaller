@echo off
echo Downloading latest filelist...
:: This script downloads sonic_mania_files_list.txt from github.com/koolkdev/rsdkv5_extract
powershell "($WebClient = New-Object System.Net.WebClient).DownloadFile('https://github.com/koolkdev/rsdkv5_extract/blob/master/sonic_mania_files_list.txt?raw=true', 'Data.txt')"
echo Done.