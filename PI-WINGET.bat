@echo off

:: Verifica se l'utente ha i permessi di amministratore
net session >nul 2>&1 || (
    echo Questo script richiede i permessi di amministratore.
    echo Si prega di eseguire questo script come amministratore.
    pause
)

:: Icone Desktop
echo Aggiungo le Icone del Desktop
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v {20D04FE0-3AEA-1069-A2D8-08002B30309D} /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v {5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0} /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v {59031a47-3f72-44a7-89c5-5595fe6b30ee} /t REG_DWORD /d 0 /f
echo Icone del Desktop Aggiunte

:: Ottimizzazione Grafica
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f

:: .Net Framework 2.0 e 3.0
echo Installazione .Net framework 2.0 e 3.0
dism /Online /Enable-Feature /FeatureName:"NetFx3"

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