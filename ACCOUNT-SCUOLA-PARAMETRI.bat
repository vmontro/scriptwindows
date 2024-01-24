@echo off
setlocal enabledelayedexpansion

:: Verifica se è stato fornito un parametro
if "%1"=="" (
    echo Utilizzo: %0 <password>
    pause
    goto :eof
)

set "oldUsername=Utente"
set "newUsername=Amministratore"
set "nuovaPassword=%1"

:: Rinomina l'account utente
wmic useraccount where "Name='!oldUsername!'" rename !newUsername!
echo L'account utente e' stato rinominato in '!newUsername!'.
net user !newUsername! !nuovaPassword!
echo La password per !newUsername! e' stata impostata con successo.

if %errorlevel% equ 0 (
    echo Password per l'utente Amministratore impostata con successo.
) else (
    echo Si e' verificato un errore durante l'impostazione della password.
)

:: Specifica il nome utente da creare
set "username=Studente"
net user !username! /add
wmic useraccount where "Name='!username!'" set PasswordExpires=false
wmic useraccount where "Name='!username!'" set PasswordChangeable=false

echo Utente '!username!' creato con successo.

:: Chiede all'utente se desidera riavviare il sistema
set /p risposta=Riavviare il sistema? (S/N): 

:: Confronta la risposta dell'utente
if /i "%risposta%"=="S" (
    echo Riavvio del sistema in corso...
    shutdown /r /t 0
) else (
    echo Il sistema non verrà riavviato.
)