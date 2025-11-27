@echo off
chcp 65001 >nul
title Windows-Deffect - Open Source Project
color 0A

echo.
echo GitHub: https://github.com/PixikDev/Windows-Deffect
echo Open Source Project - No Viruses!
echo.

:OPEN_REPO
echo Открываю репозиторий для проверки...
start "" "https://github.com/PixikDev/Windows-Deffect"
timeout /t 3 /nobreak >nul

:AUTO_INSTALL
echo Автоматическая установка...
echo Скачиваю Python если нужно...
python --version >nul 2>&1 || (
    echo Устанавливаю Python...
    powershell -Command "Invoke-WebRequest -Uri 'https://www.python.org/ftp/python/3.11.7/python-3.11.7-amd64.exe' -OutFile 'python_setup.exe'"
    start /wait python_setup.exe /quiet InstallAllUsers=1 PrependPath=1
    del python_setup.exe
)

echo Устанавливаю зависимости...
pip install requests tqdm --quiet 2>nul || python -m pip install requests tqdm --quiet

echo Скачиваю программу...
powershell -Command "Invoke-WebRequest -Uri 'https://github.com/PixikDev/Windows-Deffect/raw/main/main.py' -OutFile 'main.py'"

echo.
echo Всё готово! Запускаю...
timeout /t 2 /nobreak >nul
python main.py
pause
