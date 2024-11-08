@echo off

python --version >nul 2>&1
if %errorlevel% neq 0 (
    powershell -Command "Invoke-WebRequest -Uri https://www.python.org/ftp/python/3.11.0/python-3.11.0-amd64.exe -OutFile python_installer.exe"
    start /wait python_installer.exe /quiet InstallAllUsers=1 PrependPath=1
)

powershell -Command "Invoke-WebRequest -Uri https://raw.githubusercontent.com/nichind/screenclip-autosave/main/main.py -OutFile %USERPROFILE%\screenclip_autosave\main.py"

echo python "%USERPROFILE%\screenclip_autosave\main.py" > "%USERPROFILE%\screenclip_autosave\screenclip_autosave_start.bat"

copy "%USERPROFILE%\screenclip_autosave\screenclip_autosave_start.bat" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
