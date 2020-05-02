Function ArrayListExample
{
    $ArrayList = New-Object -TypeName System.Collections.ArrayList
    
    #Add method is chatty. It writes the element value to the console
    #We pipe that to Out-Null so we don't see it
    $ArrayList.Add("Spam") |Out-Null
    $ArrayList.Add("Bacon") |Out-Null
    $ArrayList.Add("Eggs") |Out-Null
    
    <#Weird Syntax is String Interpolation. $Count = $Arraylist.count
    #Is the same as $($ArrayList.count)
    #>

    Write-Host "Arraylist: $($ArrayList[0]) $($ArrayList[1]) $($ArrayList[2])"
    
    # ` is the escape char in powershell `n = newline

    Write-Host "Arraylist.count: $($Arraylist.count)`n"

    $Arraylist.Remove("Spam") | Out-Null

    Write-Host "Arraylist: $($ArrayList[0]) $($ArrayList[1]) $($ArrayList[2])"
    
    # ` is the escape char in powershell `n = newline

    Write-Host "Arraylist.count: $($Arraylist.count)`n"
    }

ArrayListExample

Function ArrayExample
{
    $Array0 = @("Spam", "Eggs", "Bacon")

    #Weird Syntax = Calling new method on Static class System.Object[]
    #Also demonstrating polymorphism in that we are casting it to string[]
    [string[]] $Array1 = [System.Object[]]::new(3)

    #Try commenting out [string[]] and uncommenting
    #the line below to see what I mean
    #$Array1.getType()

    Write-Host "Array0: $Array0"
    Write-Host "Array0.count: $($Array0.count)`n"

    $Array1[0] = "Spam1"

    $Array1[1] = "Eggs"

    $Array1[2] = "Bacon"

    Write-Host "Array1: $Array1"
    $Array1Count = $Array1.count
    Write-Host "Array1.count: $Array1Count`n"

    #Example 1:
    #Don't fall victim to this rookie mistake:
    Write-Host '$Array1 = $Array0'
    $Array1 = $Array0
    Write-Host '$Array0 == $Array1 ' -NoNewline
    $Array0.Equals($Array1)
    Write-Host ''


    #It works below why wouldn't it work above?? ;p

    Write-Host '$Array2 = $Array0'
    $Array2 = $Array0
    Write-Host '$Array0 == $Array2 ' -NoNewline
    $Array0.Equals($Array2)

    Write-Host ''

    #Use compare-object instead of the Equals method

    Write-Host "Compare Object Example:`n"

    $Object0 = Compare-Object -ReferenceObject $Array0 -DifferenceObject $Array1

    if($Object0)
    {
        Write-Host $True
    }
    Else
    {
        Write-Host $False
    }

    [string[]] $Array3 = @("Spam1", "Eggs1", "Bacon1")

    $Object1 = Compare-Object -ReferenceObject $Array2 -DifferenceObject $Array3
    
    if($Object1)
    {
        $True
    }
    Else
    {
        $False
    }
}    
    

ArrayExample