@echo off
setlocal enabledelayedexpansion

set "oldUsername=Utente"
set "newUsername=Amministratore"
set "newPassword=Cafiero#2017"

:: Rinomina l'account utente
wmic useraccount where "Name='!oldUsername!'" rename !newUsername!
net user !newUsername! !newPassword!

echo L'account utente e' stato rinominato in '!newUsername!' e la password e' stata impostata con successo.

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
    echo Il sistema non verra' riavviato.
)
