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

Function ArrayExample
{
    #Initialize Array0. This is the more common way to initialize arrays

    $Array0 = @("Potatoes", "Eggs", "Sausage")

    # Initialize Array1. This is the less common way to initialize arrays.
    # Weird Syntax = Calling new method on Static class System.Object[]

    $Array1 = [System.Object[]]::new(3)
    $Array1[0] = "Chorizo"
    $Array1[1] = "Eggs"
    $Array1[2] = "Cheese"

    DisplayCollection($Array0)

    DisplayCollection($Array1)
} 

Function ArrayListExample
{

    # Initialize an arraylist

    $Arraylist = New-Object -TypeName System.Collections.ArrayList

    # Add Elements to the arraylist

    $Arraylist.add("Spam") | Out-Null
    $Arraylist.add("Bacon") | Out-Null
    $Arraylist.add("Eggs") | Out-Null

    DisplayCollection($Arraylist)

    # Remove an element

    $Arraylist.remove("Spam")

    DisplayCollection($Arraylist)
}

Function BuildArraylistAssignToArray
{
        # Initialize an arraylist

        $Arraylist = New-Object -TypeName System.Collections.ArrayList

        # Add Elements to the arraylist

        $Arraylist.add("Spam") | Out-Null
        $Arraylist.add("Bacon") | Out-Null
        $Arraylist.add("Eggs") | Out-Null
    
        DisplayCollection($Arraylist)

        # Initialize an array and set it's length equal to the length of the arraylist

        [object[]] $Array = [System.Object[]]::new($Arraylist.Count)

        # Assign arraylist elements to array

        For($i=0; $i -LT $Arraylist.Count; $i++)
        {
            $Array[$i] = $Arraylist[$i]
        }

        #Return the array so we can use it in the pipeline

        return $Array
} 
    
ArrayExample

ArrayListExample

BuildArraylistAssignToArray | Out-GridView