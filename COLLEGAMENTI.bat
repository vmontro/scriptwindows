@echo off
set "desktopPath=%PUBLIC%\Desktop"
set "wordExePath=C:\Program Files\Microsoft Office\Root\Office16\WINWORD.EXE"
set "excelExePath=C:\Program Files\Microsoft Office\Root\Office16\EXCEL.EXE"
set "shortcutWordPath=%desktopPath%\Word.lnk"
set "shortcutExcelPath=%desktopPath%\Excel.lnk"

if not exist "%wordExePath%" (
    echo Microsoft Word non è installato nel percorso specificato.
    goto :eof
)

if not exist "%excelExePath%" (
    echo Microsoft Excel non è installato nel percorso specificato.
    goto :eof
)

mklink "%shortcutWordPath%" "%wordExePath%"

if exist "%shortcutWordPath%" (
    echo Collegamento a Microsoft Word creato sul desktop pubblico.
) else (
    echo Impossibile creare il collegamento a Microsoft Word.
)

mklink "%shortcutExcelPath%" "%excelExePath%"

if exist "%shortcutExcelPath%" (
    echo Collegamento a Microsoft Excel creato sul desktop pubblico.
) else (
    echo Impossibile creare il collegamento a Microsoft Excel.
)