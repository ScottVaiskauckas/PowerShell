function Install-Software
{
    [CmdletBinding()]
    Param($Path ="$env:userprofile\Downloads\GoogleChromeEnterpriseBundle64\Installers",
        $FileName = "GoogleChromeStandaloneEnterprise64.msi",
        $LogDir = "C:\Logs")
        
        If( -Not(Test-Path $LogDir))
        {
            New-Item -ItemType Directory -Path $LogDir
        }

        $ArgumentList = "/package $Path\$FileName /passive /log $LogDir\Chrome.log"

        Start-Process msiexec.exe -ArgumentList $ArgumentList
}

function Get-Logs
{
    [CmdletBinding()]
    Param([Parameter(Mandatory=$True)]$Path)
    $Path = "C:\logs"

    $LogFiles = Get-ChildItem -Path $Path

    Foreach($LogFile in $LogFiles)
    {
        $Contents = Get-Content -Path $Path\$LogFile
        $ErrorStatus = $Contents | Select-String "Installation success or error status:"

        $ErrorStatus = $ErrorStatus -cSplit "P", 2
        $OperationType = $ErrorStatus[0]
        $ErrorStatus = "P$($ErrorStatus[1])"
        
        $ErrorStatus = $ErrorStatus -cSplit "M", 2
        $ProductInfo = $ErrorStatus[0]
        $ErrorStatus = "M$($ErrorStatus[1])"

        $LogObject = New-Object -TypeName PSCustomObject

        $LogObject | Add-Member -MemberType NoteProperty -Name 'OperationType' -Value $OperationType
        $LogObject | Add-Member -MemberType NoteProperty -Name 'ProductInfo' -Value $ProductInfo
        $LogObject | Add-Member -MemberType NoteProperty -Name 'ErrorStatus' -Value $ErrorStatus
        
        Return $LogObject
    }

}