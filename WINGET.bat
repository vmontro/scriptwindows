@echo off

:: Chiamate alla funzione per l'installazione dei vari software
call :InstallSoftware Google.Chrome
call :InstallSoftware Mozilla.Firefox
call :InstallSoftware VideoLAN.VLC
call :InstallSoftware RARLab.WinRAR
call :InstallSoftware Adobe.Acrobat.Reader.64-bit
call :InstallSoftware AnyDeskSoftwareGmbH.AnyDesk

echo Installazione completata.
exit /b 0

:: Funzione per l'installazione del software
:InstallSoftware
echo Installazione di %1...
winget install %1
if %errorlevel% neq 0 (
    echo Si è verificato un errore durante l'installazione di %1.
    pause
    exit /b 1
)
echo Installazione %1 completata.
exit /b 0