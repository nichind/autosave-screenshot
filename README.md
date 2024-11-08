# ScreenClip Autosave

This project provides a simple script to automatically save screenshots taken with the built-in Windows ScreenClip tool.

The script monitors the Screen Clip temporary folder and copies any new screenshots to the user's **Pictures/Screenshots** folder, renaming them with a date and time the screenshot was taken.

## Installation

To install the script and all dependencies automatically, run the following command in PowerShell (`win+x` > `i`):

```powershell
powershell -Command "Invoke-WebRequest -Uri https://raw.githubusercontent.com/nichind/screenclip-autosave/main/install.bat -OutFile install.bat; .\install.bat"
```

## Uninstallation

1. Open the Run dialog by pressing `Win + R`.
2. Type `%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\` and press `Enter`.
3. Select file `screenclip_autosave_start.bat` and delete it.
4. Navigate to `C:\Users\%USERNAME%` using File Explorer.
5. Delete the `screenclip_autosave` folder.

## But why?

idk, silly idea that I wasn't able to stop myself from thinking about.
