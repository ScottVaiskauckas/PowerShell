Function Test-UserProfile {
    [CmdletBinding()]
    param(
            [Parameter(Mandatory)]
            [string] $SourceComputerName,
            [Parameter(Mandatory)]
            [string] $DestComputerName,
            [Parameter(Mandatory)]
            [string] $UserName,
            $Function,
            [string[]]$ArgumentList
        )
    if (-not(Test-Path -Path "\\$SourceComputerName")) {
        
        Invoke-Command -ScriptBlock $Function -ArgumentList $ArgumentList
        $e = "Source Computer: $SourceComputerName Not Found"
        Return $e

    } elseif (-not(Test-Path -Path "\\$SourceComputerName\C`$\Users\$UserName")) {
        
        $e = "$UserName's Profile Not Found On Source Computer: $ComputerName"
        Return $e

    } elseif (-not(Test-Path -Path "\\$DestComputerName")) {
        
        $e = "Destination Computer: $DestComputerName Not Found"
        Return $e

    } elseif (-not(Test-Path -Path "\\$DestComputerName\C`$\Users\$UserName")) {
        
        $e = "$UserName's Profile Not Found On Destination Computer: $DestComputerName"
        Return $e

    } else {
        
        Invoke-Command -ScriptBlock $Function -ArgumentList $ArgumentList
        $e = "$UserName's Profile Was Copied From $SourceComputerName To $DestComputerName"
        Return $e

    }
}