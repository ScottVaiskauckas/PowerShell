Import-Module "..\ErrorHandling\ErrorHandling.psm1"

function Copy-UserFolders {
    param(
        [Parameter(Mandatory)]
        [string] $SourceComputerName,
        [Parameter(Mandatory)]
        [string] $DestComputerName,
        [Parameter(Mandatory)]
        [string] $UserName
    )
    $SourcePath = "\\$SourceComputerName\C`$\Users\$UserName"
    $DestPath = "\\$DestComputerName\C`$\Users\$UserName"

    Function Copy-Folders{
        [CmdletBinding()]
        param(
            [string] $SourcePath,
            [string] $DestPath
            )
        Copy-Item -Path "$SourcePath\Desktop" -Destination "$DestPath\Desktop"
        Copy-Item -Path "$SourcePath\Documents" -Destination "$DestPath\Documents"
        Copy-Item -Path "$SourcePath\Downloads" -Destination "$DestPath\Downloads"
        Copy-Item -Path "$SourcePath\Favorites" -Destination "$DestPath\Favorites"
        Copy-Item -Path "$SourcePath\Pictures" -Destination "$DestPath\Pictures"
        Copy-Item -Path "$SourcePath\Music" -Destination "$DestPath\Music"
        Copy-Item -Path "$SourcePath\Movies" -Destination  "$DestPath\Movies"

    }

    Test-UserProfile -SourceComputerName $SourceComputerName -DestComputerName $DestComputerName -UserName $UserName ${function:Copy-Folders} -ArgumentList $SourcePath,$DestPath
}