$mainPyPath = Join-Path -Path $env:APPDATA -ChildPath "screenclip-autosave\main.py"

Invoke-WebRequest -Uri https://raw.githubusercontent.com/nichind/screenclip-autosave/main/main.py -OutFile $mainPyPath

$batContent = @"
@echo off

:: Check if Python is installed
python --version >nul 2>&1
if %errorlevel% neq 0 (
    :: Install Python if not installed
    powershell -Command ""Invoke-WebRequest -Uri https://www.python.org/ftp/python/3.9.7/python-3.9.7-amd64.exe -OutFile python_installer.exe""
    start /wait python_installer.exe /quiet InstallAllUsers=1 PrependPath=1
)

:: Run the Python script
python "%APPDATA%\screenclip-autosave\main.py"
"@
$batContent | Out-File -FilePath screenclip_autosave_start.bat -Encoding ascii

$startupPath = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"
Copy-Item -Path .\screenclip_autosave_start.bat -Destination $startupPath
