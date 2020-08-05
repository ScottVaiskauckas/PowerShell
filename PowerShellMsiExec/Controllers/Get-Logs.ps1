Function Controller
{
    $Path = Split-Path -Path $MyInvocation.PSScriptRoot
    Import-Module "$Path"

    Get-Logs -Path C:\Logs
}

$ResultArray = Controller

Foreach($Result in $ResultArray)
{
Write-Host ""
Write-Host $Result.OperationType
Write-Host $Result.ProductInfo
Write-Host $Result.ErrorStatus
Write-Host ""
}