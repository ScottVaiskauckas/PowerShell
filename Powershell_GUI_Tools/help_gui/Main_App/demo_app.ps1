Function View {
    Add-Type -AssemblyName System.Windows.Forms
    
    $Form = New-Object System.Windows.Forms.Form
    $Form.Size = New-Object System.Drawing.Size(450,450)
    $Form.Text = "Main App"

    $LinkLabel = New-Object System.Windows.Forms.LinkLabel
    $LinkLabel.Location = New-Object System.Drawing.Size(20,50)
    $LinkLabel.Size = New-Object System.Drawing.Size(115,20)
    $LinkLabel.LinkColor = "#0074A2"
    $LinkLabel.ActiveLinkColor = "#114C7F"
    $LinkLabel.Text = "Help"
    $LinkLabel.add_Click({powershell.exe .\Help_Gui\help_gui.ps1})
    $Form.Controls.Add($LinkLabel)
    
    $Form.ShowDialog()
}

View