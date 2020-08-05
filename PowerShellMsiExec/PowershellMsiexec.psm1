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

    $LogFiles = Get-ChildItem -Path $Path -File

    $ArrayList = New-Object -TypeName System.Collections.ArrayList

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
        
        $ArrayList.Add($LogObject) | Out-Null
    }

    $Array = New-Object Object[] ($ArrayList.Count)
    
    For($i=0; $i -lt $ArrayList.Count; $i++)
    {
        $Array[$i] = $ArrayList[$i]
    }

    Return $Array
}