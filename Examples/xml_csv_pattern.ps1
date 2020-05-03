Function Get-XmlGroupMember
{
    [CmdletBinding()]
    param(
        $Path = "$env:userprofile\Documents\Admins",
        $XmlFile = "$env:ComputerName.xml"
    )

    If(-not (Test-Path $Path))
    {
        New-Item -ItemType Directory -Path "$Path"
    }

    $Arraylist = New-Object -TypeName System.Collections.Arraylist
    
    Get-LocalGroupMember -Group "Administrators" |
    Select-Object -Property @{name='ComputerName';expression={$env:ComputerName}},* |
    Foreach-Object {$Arraylist.add($_) | Out-Null}

    $Array = [Object[]]::new($Arraylist.count)
    
    For($i=0;$i-lt($Arraylist.Count);$i++)
    {
        $Array[$i]=$Arraylist[$i]
    }

    $Array | Export-Clixml "$Path\$XmlFile"
}

Get-XmlGroupMember

Function Format-XmlResultsAsCsv
{
    [CmdletBinding()]
    param(
        $Path = "$env:userprofile\Documents\Admins",
        $CsvFile = "admins.csv"
    )

    $Files = Get-ChildItem $Path | Where-Object -property Name -like "*.xml"

    $Arraylist = New-Object -TypeName System.Collections.Arraylist

    Foreach($File in $Files)
    {
        $Object = Import-Clixml "$Path\$File"
        $Arraylist.add($Object) |Out-Null
    }

    $Array = [Object[]]::new($Arraylist.count)
    
    For($i=0;$i-lt($Arraylist.count);$i++)
    {
        $Array[$i] = $Arraylist[$i]
    }
    
    $Array = $Array | 
    Foreach-Object {$_ | Select-Object -Property ComputerName, Name, PrincipalSource}
    
    $Array |Export-csv "$Path\$CsvFile"

    Import-csv "$Path\$CsvFile"
}

Format-XmlResultsAsCsv
