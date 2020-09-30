Function ArrayExample1()
{
    $BreakfastArray = @("Eggroll", "Ham", "Cheese")
    
    return $BreakfastArray
}

$BreakfastArray = ArrayExample1
$BreakfastArrayElement1 = $BreakfastArray[0]
$BreakfastArrayElement2 = $BreakfastArray[1]
$BreakfastArrayElement3 = $BreakfastArray[2]
$BreakfastArrayCount = $BreakfastArray.count

Write-Host "Breakfast is an $BreakfastArrayElement1, $BreakfastArrayElement2, and $BreakfastArrayElement3"
Write-Host "The Array contains $BreakfastArrayCount elements"
Write-Host ""

Function ArrayExample2()
{
    $LunchArray = [System.Object[]]::new(3)
    $LunchArray[0]="Rye"
    $LunchArray[1]="Turkey"
    $LunchArray[2]="Swiss"
    
    return $LunchArray
}

$LunchArray = ArrayExample2
$LunchArrayElement1 = $LunchArray[0]
$LunchArrayElement2 = $LunchArray[1]
$LunchArrayElement3 = $LunchArray[2]
$LunchArrayCount = $LunchArray.count

Write-Host "Lunch is an $LunchArrayElement1, $LunchArrayElement2, and $LunchArrayElement3"
Write-Host "The Array contains $LunchArrayCount elements"
Write-Host ""

Function ArrayExample3()
{
    $DinnerArray = @("Salmon", "Potatoes", "Asparagus")
    $DinnerArrayCopy = $DinnerArray
    $DinnerArrayCopy[2] = "Brussel Sprouts"
    
    return $DinnerArray
}

$DinnerArray = ArrayExample3
$DinnerArrayElement1 = $DinnerArray[0]
$DinnerArrayElement2 = $DinnerArray[1]
$DinnerArrayElement3 = $DinnerArray[2]
$DinnerArrayCount = $DinnerArray.count

Write-Host "Dinner is an $DinnerArrayElement1, $DinnerArrayElement2, and $DinnerArrayElement3"
Write-Host "The Array contains $DinnerArrayCount elements"
Write-Host ""

Function ArrayExample4()
{
    $ObjectArray = @("String", 1, 1.2)
    
    return $ObjectArray
}

$ObjectArray = ArrayExample4
$ObjectArray.getType()
$ObjectArray[0].getType()
$ObjectArray[1].getType()
$ObjectArray[2].getType()