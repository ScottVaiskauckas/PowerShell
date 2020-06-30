@echooff
set ScriptPath="%~dp0\Controllers\Install-Software.ps1"
PowerShell.exe -ExecutionPolicy Bypass -File %ScriptPath% -RunAs
PAUSE