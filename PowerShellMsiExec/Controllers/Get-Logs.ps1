Function Controller
{
    $Path = Split-Path -Path $MyInvocation.PSScriptRoot
    Import-Module "$Path"

    Get-Logs -Path C:\Logs
}

$Result = Controller
$Result.OperationType
$Result.ProductInfo
$Result.ErrorStatus