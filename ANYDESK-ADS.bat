@echo off
setlocal
taskkill /F /IM anydesk.exe
set "folderRoaming=C:\Users\%username%\AppData\Roaming\AnyDesk"

:: Controlla se la cartella esiste
if exist "%folderRoaming%" (
    echo Cancellazione della cartella: %folderRoaming%
    rmdir /s /q "%folderRoaming%"
    echo Cartella Anydesk Roaming cancellata con successo.
) else (
    echo Anydesk Roaming non esistente.
)

set "folderProgramData=C:\ProgramData\AnyDesk"

:: Controlla se la cartella esiste
if exist "%folderProgramData%" (
    echo Cancellazione della cartella: %folderProgramData%
    rmdir /s /q "%folderProgramData%"
    echo Cartella Anydesk ProgramData cancellata con successo.
) else (
    echo Anydesk ProgramData non esistente.
)
echo Puoi scrosciare anche oggi anydesk
pause
endlocal
