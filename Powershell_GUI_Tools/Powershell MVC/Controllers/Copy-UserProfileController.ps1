Import-Module "..\Modules\Copy-UserProfile.psm1"
Function Copy-UserProfileController {
    param(
        [string] $SourceComputerName, 
        [string] $DestComputerName, 
        [string] $UserName,
        [object] $ResultsLabel
    )
        
        $e = Copy-UserFolders -SourceComputerName $SourceComputerName -DestComputerName $DestComputerName -UserName $UserName
        $ResultsLabel.Text = $e

    }