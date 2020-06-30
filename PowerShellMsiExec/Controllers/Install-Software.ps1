Function Controller
{
    $Path = Split-Path -Path $MyInvocation.PSScriptRoot
    Import-Module "$Path""

Install-Software
}

Controller