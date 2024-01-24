:: Controlla l'architettura del pc in uso
@echo off

if "%PROCESSOR_ARCHITECTURE%"=="AMD64" (
    echo Il computer e basato su architettura x64
    
    if exist "C:\Program Files\Windows Photo Viewer\PhotoViewer.dll" (
        :: Registra la PhotoViewer.dll
        echo Il file PhotoViewer.dll x64 esiste
        regsvr32 "C:\Program Files\Windows Photo Viewer\PhotoViewer.dll"
        goto add_regedit_keys
    ) else (
        echo Il file PhotoViewer.dll x64 NON esiste
        pause
    )
) else if "%PROCESSOR_ARCHITECTURE%"=="x86" (
    echo Il computer e basato su architettura x86 (32-bit)
    if exist "C:\Program Files (x86)\Windows Photo Viewer\PhotoViewer.dll" (
        :: Registra la PhotoViewer.dll
        echo Il file PhotoViewer.dll esiste
        regsvr32 "C:\Program Files (x86)\Windows Photo Viewer\PhotoViewer.dll"
        goto add_regedit_keys
    ) else (
        echo Il file PhotoViewer.dll NON esiste
        pause
    )
) else (
    echo Architettura non riconosciuta: %PROCESSOR_ARCHITECTURE%
    pause
)


:: Registrazione Chiavi di Registro
:add_regedit_keys
echo Aggiungo le chiavi di registro
regedit /s C:\Windows\Temp\PhotoViewer.bmp.reg
regedit /s C:\Windows\Temp\PhotoViewer.jpe.reg
regedit /s C:\Windows\Temp\PhotoViewer.jpeg.reg
regedit /s C:\Windows\Temp\PhotoViewer.jpg.reg
echo PhotoViewer Installato con Successo
pause