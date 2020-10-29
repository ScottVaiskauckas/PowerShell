$ParentDirectory = "C:\Users\Scott\Desktop\print_pdf"
$PathToNetworkPrinter = "\\servername\printername"
$Files = Get-ChildItem $ParentDirectory

Foreach($File in $Files)
{
    $FileName = $File.name

    Start-Process "$ParentDirectory\$FileName" -verb printto $PathToNetworkPrinter
}