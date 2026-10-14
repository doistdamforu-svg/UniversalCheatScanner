@echo off
title Universal Minecraft Cheat Scanner (lwkyyy)
cd /d "%~dp0"

if "%~1"=="" (
    powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0UniversalCheatScanner.ps1"
) else (
    powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0UniversalCheatScanner.ps1" -Target "%~1"
)

pause
