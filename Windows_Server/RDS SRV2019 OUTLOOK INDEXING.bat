reg add "HKLM\SOFTWARE\Microsoft\Windows Search" /v EnablePerUserCatalog /t REG_DWORD /d 0
net stop wsearch
net start wsearch