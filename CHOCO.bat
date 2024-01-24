@echo off

:: Verifica se l'utente ha i permessi di amministratore
net session >nul 2>&1 || (
    echo Questo script richiede i permessi di amministratore.
    echo Si prega di eseguire questo script come amministratore.
    pause
)

:: Installa Chocolatey
echo Installazione di Chocolatey...
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
if %errorlevel% neq 0 (
    echo Si è verificato un errore durante l'installazione di Chocolatey.
    pause
    exit /b 1
)

:: Chiamate alla funzione per l'installazione dei vari software
call :InstallSoftware googlechrome
call :InstallSoftware firefox
call :InstallSoftware vlc
call :InstallSoftware winrar
call :InstallSoftware adobereader
call :InstallSoftware anydesk

echo Installazione completata.
exit /b 0

:: Funzione per l'installazione del software
:InstallSoftware
echo Installazione di %1...
choco install -y %1 --ignore-checksums
if %errorlevel% neq 0 (
    echo Si e' verificato un errore durante l'installazione di %1.
    pause
    exit /b 1
)
echo Installazione %1 completata.
exit /b 0