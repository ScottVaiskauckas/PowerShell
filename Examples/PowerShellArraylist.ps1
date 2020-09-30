function Example1
{
    $Arraylist = New-Object -typename System.Collections.ArrayList

    $Arraylist.add("Lettuce")
    $Arraylist.add("Cucumbers")
    $Arraylist.add("Tomatoes")

    return $Arraylist
}

$Arraylist1 = Example1
$Arraylist1Count = $Arraylist1.count
Write-Host "Arraylist 1 has $Arraylist1Count elements:"
Write-Host "---------------------------"
$Arraylist1
Write-Host ""

function Example2
{
    $Arraylist = New-Object -typename System.Collections.ArrayList

    $Arraylist.add("Lettuce") | Out-Null
    $Arraylist.add("Cucumbers") | Out-Null
    $Arraylist.add("Tomatoes") | Out-Null

    return $Arraylist
}

$Arraylist2 = Example2
$Arraylist2Count = $Arraylist2.count
Write-Host "Arraylist 2 has $Arraylist2Count elements:"
Write-Host "---------------------------"
$Arraylist2
Write-Host ""

function Example3
{
    $Arraylist = New-Object -typename System.Collections.ArrayList

    $Arraylist.add("Bacon") | Out-Null
    $Arraylist.add("Mushrooms") | Out-Null
    $Arraylist.add("Cheese") | Out-Null
    $Arraylist.add("Bun") | Out-Null

    $Arraylist.Remove("Bacon")

    return $Arraylist
}

$Arraylist3 = Example3
$Arraylist3Count = $Arraylist3.count
Write-Host "Arraylist 3 has $Arraylist3Count elements:"
Write-Host "---------------------------"
$Arraylist3
Write-Host ""

function Example4
{
    $Arraylist = New-Object -typename System.Collections.ArrayList

    $Arraylist.add("Bacon") | Out-Null
    $Arraylist.add("Mushrooms") | Out-Null
    $Arraylist.add("Cheese") | Out-Null
    $Arraylist.add("Bun") | Out-Null

    $Arraylist[0]="Peppers"

    return $Arraylist
}

$Arraylist4 = Example4
$Arraylist4Count = $Arraylist4.count
$Element0 = $Arraylist4[0]
Write-Host "Arraylist 4 has $Arraylist4Count elements:"
Write-Host "---------------------------"
$Arraylist4
Write-Host ""
Write-Host "Element 0 is $Element0"
Write-Host ""

function Example5
{
    $Arraylist = New-Object -typename System.Collections.ArrayList

    $Arraylist.add("Bacon") | Out-Null
    $Arraylist.add("Mushrooms") | Out-Null
    $Arraylist.add("Cheese") | Out-Null
    $Arraylist.add("Bun") | Out-Null

    $ArraylistCopy = $Arraylist
    $Arraylist[0]="Peppers"

    $ArraylistCopy.remove("Mushrooms")

    return $Arraylist
}

$Arraylist5 = Example5
$Arraylist5Count = $Arraylist5.count
Write-Host "Arraylist 5 has $Arraylist5Count elements:"
Write-Host "---------------------------"
$Arraylist5
Write-Host ""