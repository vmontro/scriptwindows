@echo off
setlocal enabledelayedexpansion
set "oldUsername=Utente"
set "newUsername=Studente"
wmic useraccount where "Name='!oldUsername!'" rename !newUsername!
net localgroup Administrators !newUsername! /delete
net localgroup Users !newUsername! /add
wmic useraccount where "Name='!newUsername!'" set PasswordExpires=false
wmic useraccount where "Name='!newUsername!'" set PasswordChangeable=false
set "username=Amministratore"
set "password=PASSWORD123"
net user !username! !password! /add
net localgroup Administrators !username! /add
net localgroup Users !username! /delete
wmic useraccount where "Name='!username!'" set PasswordExpires=false
shutdown /r /t 0
