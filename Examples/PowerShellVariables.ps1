###Initialization and Assignment (PowerShell best practice)###
$a=1
Write-Host ""
Write-Host "Variable a"
Write-Host "---------------"
Write-Host "Variable a's value is $a"
Write-Host "Variable a's type is $($a.getType())"

###Specifying the type of the variable###
[string] $b = "String"
Write-Host ""
Write-Host "Variable b"
Write-Host "---------------"
Write-Host "Variable b's value is $b"
Write-Host "Variable b's type is $($b.getType())"

###Casting the type of the variable###
[string] $c = 1
Write-Host ""
Write-Host "Variable c"
Write-Host "---------------"
Write-Host "Variable c's value is $c"
Write-Host "Variable c's type is $($c.getType())"
Write-Host ""