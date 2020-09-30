# Display array or arraylist and elements in the console
Function DisplayCollection
{
    param($Collection)

    Write-Host ""
    $Type = $Collection.getType()
    $TypeName = $Type.Name

    Write-Host "Print $TypeName to console: $Collection"

    $ElementCount = 0
    Foreach($Item in $Collection)
    {
        Write-Host "Print $TypeName Element $ElementCount : $Item"
        $ElementCount++
    }

}

# Create a breakfast array
$Array1 = @("Pancakes", "Waffles", "Syrup")

# Create a beverage arraylist
$Arraylist1 = New-Object -TypeName System.Collections.Arraylist
$Arraylist1.Add("Coffee") | Out-Null

# Display the collection and its elements in the console
DisplayCollection($Array1)
DisplayCollection($Arraylist1)