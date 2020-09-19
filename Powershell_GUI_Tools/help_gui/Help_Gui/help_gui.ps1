Function View {
    Add-Type -AssemblyName System.Windows.Forms
    
    $Form = New-Object System.Windows.Forms.Form
    $Form.Size = New-Object System.Drawing.Size(450,450)
    $Form.Text = "Help"

    $Content = Get-Content -path ".\help_gui\readme.txt"
    
    $Label = New-Object System.Windows.Forms.Label
    $Label.Text = $Content
    $Label.Size = New-Object System.Drawing.Size(400,400)
    $Label.Location = New-Object System.Drawing.Size(25,25)
    $Form.Controls.Add($Label)
    
    $Form.ShowDialog()
}

View