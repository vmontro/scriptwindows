@echo off
setlocal enabledelayedexpansion

:: Chiede all'utente di inserire il nuovo nome del computer
set /p nuovoNome=Inserisci il nuovo nome del computer: 

:: Cambia il nome del computer
wmic computersystem where caption='%computername%' rename '!nuovoNome!'

:: Chiede all'utente se desidera riavviare il sistema
set /p risposta=Riavviare il sistema? (S/N): 

:: Confronta la risposta dell'utente
if /i "%risposta%"=="S" (
    echo Riavvio del sistema in corso...
    shutdown /r /t 0
) else (
    echo Il sistema non verrà riavviato.
)
