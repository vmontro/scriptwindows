@echo off
:: Verifica se l'utente ha i permessi di amministratore
net session >nul 2>&1 || (
    echo Questo script richiede i permessi di amministratore.
    echo Si prega di eseguire questo script come amministratore.
    pause
)

echo Scegli un'opzione:
echo [1] - ABILITA MICROSOFT PRINT TO PDF
echo [2] - DISABILITA MICROSOFT PRINT TO PDF
echo [3] - ESCI
choice /C 123 /N /M "SELEZIONA UN NUMERO: "

:: Controllo menu della scelta
if errorlevel 3 goto exit
if errorlevel 2 goto disable_print_to_pdf
if errorlevel 1 goto enable_print_to_pdf

:: Abilita Microsoft Print To PDF
:enable_print_to_pdf
dism /Online /Enable-Feature /FeatureName:"Printing-PrintToPDFServices-Features" /NoRestart
echo Microsoft Print To PDF Abilitato.
goto exit

:: Disabilita Microsoft Print To PDF
:disable_print_to_pdf
dism /Online /Disable-Feature /FeatureName:"Printing-PrintToPDFServices-Features" /NoRestart
echo Microsoft Print To PDF Disabilitato.
goto exit

:exit
echo Fine Programma
pause