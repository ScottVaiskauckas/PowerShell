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

Function BuildArraylistAssignToArray
{
        # Initialize an arraylist

        $Arraylist = New-Object -TypeName System.Collections.ArrayList

        # Add Elements to the arraylist

        $Arraylist.add("Spam") | Out-Null
        $Arraylist.add("Bacon") | Out-Null
        $Arraylist.add("Eggs") | Out-Null

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

#Display the result of the function with DisplayCoullection
DisplayCollection(BuildArraylistAssignToArray)

#Pipe the result of the function into Out-Gridview
BuildArraylistAssignToArray | Out-GridView