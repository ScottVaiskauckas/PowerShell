###Simple Spam function###
Function Spam()
{
    Write-Host "Function Spam output:"
    Write-Host "Hi, my name is Spam"
    Write-Host ""
}

Spam

###Cheese function with positional input parameters###
Function Cheese()
{
    $Cheese = $args[0]
    Write-Host "Function Cheese output:"
    Write-Host "Hi, my name is $Cheese"
    Write-Host ""
}

Cheese "Gruyere"

Cheese "Swiss"

###Eggs function with named input parameters###
Function Eggs()
{
    param($Spam)
    Write-Host "Function Eggs output:"
    Write-Host "Hi, my name is $Spam"
    Write-Host ""
}

Eggs -Spam "Eggs"

Eggs -Spam "Bacon"

###Bacon function with input parameters with default value###
Function Bacon()
{
    param($Spam="Bacon")
    Write-Host "Function Bacon output:"
    Write-Host "Hi, my name is $Spam"
    Write-Host ""
}

Bacon

Bacon -Spam "Ham"

###Returning values without the return statement###
Function Ham()
{
    $Meat="Ham"
    $Cheese="Provolone"
    $Carb="Bagel"

    $Meat
    $Cheese
    $Carb
}

Write-Host "Function Ham returned the following:"
Ham

#Assign return values to variable $Ham
$Ham = Ham
#Display the type of the returned values
$Ham.getType()

Write-Host ""

#Returning values with the return statement
Function Sausage()
{
    $Meat="Sausage"
    $Cheese="American"
    $Carb="English Muffin"

    return $Meat
    $Cheese
    $Carb
}

Write-Host "Function Sausage returned the following:"
Sausage

#Assign return values to variable $Sausage
$Sausage = Sausage
#Display the type of the returned values
$Sausage.getType()
Write-Host ""

Function TurkeySausage()
{
    $Meat="TurkeySausage"
    $Cheese="American"
    $Carb="English Muffin"

    $Meat
    $Cheese
    return $Carb
}

Write-Host "Function TurkeySausage returned the following:"
TurkeySausage

#Assign return values to variable $Sausage
$TurkeySausage = TurkeySausage
#Display the type of the returned values
$TurkeySausage.getType()
Write-Host ""