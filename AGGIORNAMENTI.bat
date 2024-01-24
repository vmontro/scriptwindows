@echo off
:: Verifica se l'utente ha i permessi di amministratore
net session >nul 2>&1 || (
    echo Questo script richiede i permessi di amministratore.
    echo Si prega di eseguire questo script come amministratore.
    pause
)

echo Scegli un'opzione:
echo [1] - ABILITA AGGIORNAMENTI
echo [2] - DISABILITA AGGIORNAMENTI
echo [3] - ESCI
choice /C 123 /N /M "SELEZIONA UN NUMERO: "

:: Controllo menu della scelta
if errorlevel 3 goto exit
if errorlevel 2 goto disable_windows_updates
if errorlevel 1 goto enable_windows_updates

:: Disabilita Aggiornamenti
:disable_windows_updates
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate"
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v DoNotConnectToWindowsUpdateInternetLocations /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v SetProxyBehaviorForUpdateDetection /t REG_DWORD /d 0
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v UpdateServiceUrlAlternate /t REG_SZ /d "http:\\127.0.0.1:8080" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v WUServer /t REG_SZ /d "http:\\127.0.0.1:8080" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v WUStatusServer /t REG_SZ /d "http:\\127.0.0.1:8080" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU"
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v AUOptions /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAUAsDefaultShutdownOption /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v ScheduledInstallDay /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v ScheduledInstallFourthWeek /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v ScheduledInstallTime /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v UseWUServer /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" /v Start /t REG_DWORD /d 4 /f
:: schtasks /change /TN "Microsoft\Windows\WaaSMedic\PerformRemediation" /disable
:: schtasks /change /TN "Microsoft\Windows\WindowsUpdate\Scheduled Start" /disable
net stop wuauserv
sc config wuauserv start=disabled
echo Aggiornamenti Bloccati
goto exit

:: Abilita Aggiornamenti
:enable_windows_updates
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /f
sc config wuauserv start=demand
echo Aggiornamenti Sbloccati.
goto exit

:exit
echo Fine Programma
pause