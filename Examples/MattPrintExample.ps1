$ParentDirectory = "C:\Users\Scott\Desktop\print_pdf"
$Files = Get-ChildItem $ParentDirectory

Foreach($File in $Files)
{
    $FileName = $File.name

    Start-Process "$ParentDirectory\$FileName" -verb print
}