@echooff
set ScriptPath="%~dp0\Controllers\Get-Logs.ps1"
PowerShell.exe -ExecutionPolicy Bypass -File %ScriptPath% -RunAs
PAUSE