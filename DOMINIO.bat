@echo off

:: Verifica se sono stati forniti i parametri corretti
if "%~3"=="" (
    echo Utilizzo: %0 <NomeDominio> <NomeUtenteDominio> <PasswordDominio>
    goto :eof
)

:: Assegna i parametri alle variabili
set "nomeDominio=%1"
set "nomeUtenteDominio=%2"
set "passwordDominio=%3"

:: Esegui il comando per unire il computer al dominio
netdom join %computername% /domain:%nomeDominio% /userd:%nomeUtenteDominio% /passwordd:%passwordDominio%

:: Controlla l'esito del comando
if %errorlevel% equ 0 (
    echo Il computer è stato aggiunto al dominio con successo.
    echo Sarà necessario riavviare il computer per applicare le modifiche.
) else (
    echo Si è verificato un errore durante l'aggiunta al dominio.
)

:: Chiede all'utente se desidera riavviare il sistema
set /p risposta=Riavviare il sistema? (S/N): 

:: Confronta la risposta dell'utente
if /i "%risposta%"=="S" (
    echo Riavvio del sistema in corso...
    shutdown /r /t 0
) else (
    echo Il sistema non verrà riavviato.
)