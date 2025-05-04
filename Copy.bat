@echo off
setlocal

:: Define paths
set DESKTOP=%USERPROFILE%\Desktop\testing.txt
set DOWNLOADS=%USERPROFILE%\Downloads\testing.txt
set DOCUMENTS=%USERPROFILE%\Documents\testing.txt

:: Check if the file exists on the Desktop
if not exist "%DESKTOP%" (
    echo File testing.txt does not exist on the Desktop.
    goto :eof
)

:: Copy the file to the Downloads folder
copy "%DESKTOP%" "%DOWNLOADS%"
if errorlevel 1 (
    echo Failed to copy testing.txt to Downloads.
    goto :eof
)

:: Move the file to the Documents folder
move "%DESKTOP%" "%DOCUMENTS%"
if errorlevel 1 (
    echo Failed to move testing.txt to Documents.
    goto :eof
)

:: Delete the original file from the Desktop
del "%DESKTOP%"
if errorlevel 1 (
    echo Failed to delete testing.txt from Desktop.
    goto :eof
)

echo Successfully copied, moved, and deleted testing.txt.
endlocal