Function Format-TabDelimitedAsCSV
{
    [CmdletBinding()]
    Param(
        $TxtPath = "$env:userprofile\desktop\tab_delimited.txt",
        $CsvPath = "$env:userprofile\desktop\csv_output.csv"
    )

    $Lines = Get-Content -Path $TxtPath

    $CsvArrayList = New-Object -TypeName System.Collections.ArrayList

    Foreach($Item in $Lines)
    {
        $ItemArray = $Item.Split("	")
        $CsvArrayList.Add($ItemArray) | Out-Null
    }

    $Header = $CsvArrayList[0]
    $CsvArrayList.RemoveAt(0) | Out-Null

    $CsvObjectArrayList = New-Object -TypeName System.Collections.ArrayList

    ForEach($Item in $CsvArrayList)
    {
        $CsvObject = New-Object -TypeName PSObject

        For($i=0; $i -lt $Header.count; $i++)
        {
            $Name = $Header[$i]
            
            $Value = $Item[$i]
            
            $CsvObject | Add-Member -Type NoteProperty -Name $Name -Value $Value
        }

        $CsvObjectArrayList.add($CsvObject) | Out-Null
    }

    $CsvObjectArrayList | Export-Csv -Path $CsvPath
}

Format-TabDelimitedAsCSV