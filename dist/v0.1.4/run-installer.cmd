@echo off
setlocal
set "SCRIPT_DIR=%~dp0"
set "PORTABLE_DIR=%SCRIPT_DIR%portable"
if exist "%PORTABLE_DIR%" rmdir /s /q "%PORTABLE_DIR%"
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "Expand-Archive -Path '%SCRIPT_DIR%Overseer-v0.1.4-windows-x64.zip%' -DestinationPath '%PORTABLE_DIR%' -Force"
if errorlevel 1 exit /b 1
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%SCRIPT_DIR%install-overseer.ps1" -SourceDir "%PORTABLE_DIR%"
exit /b %ERRORLEVEL%
