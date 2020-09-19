. "..\Controllers\Copy-UserProfileController.ps1"

Function View {
    Add-Type -AssemblyName System.Windows.Forms
    
    $Form = New-Object System.Windows.Forms.Form
    $Form.Size = New-Object System.Drawing.Size(450,450)
    $Form.Text = "Copy User Profile"
    
    $Label = New-Object System.Windows.Forms.Label
    $Label.Text = "Username: "
    $Label.Size = New-Object System.Drawing.Size(100,20)
    $Label.Location = New-Object System.Drawing.Size(20,20)
    $Form.Controls.Add($Label)
    
    $TextBox = New-Object System.Windows.Forms.TextBox
    $TextBox.Size = New-Object System.Drawing.Size(120,20)
    $TextBox.Location = New-Object System.Drawing.Size(120,20)
    $Form.Controls.Add($TextBox)

    $Label2 = New-Object System.Windows.Forms.Label
    $Label2.Text = "Old PC: "
    $Label2.Size = New-Object System.Drawing.Size(100,20)
    $Label2.Location = New-Object System.Drawing.Size(20,60)
    $Form.Controls.Add($Label2)

    $TextBox2 = New-Object System.Windows.Forms.TextBox
    $TextBox2.Size = New-Object System.Drawing.Size(120,20)
    $TextBox2.Location = New-Object System.Drawing.Size(120,60)
    $Form.Controls.Add($TextBox2)

    $Label3 = New-Object System.Windows.Forms.Label
    $Label3.Text = "New PC: "
    $Label3.Size = New-Object System.Drawing.Size(100,20)
    $Label3.Location = New-Object System.Drawing.Size(20,100)
    $Form.Controls.Add($Label3)

    $TextBox3 = New-Object System.Windows.Forms.TextBox
    $TextBox3.Size = New-Object System.Drawing.Size(120,20)
    $TextBox3.Location = New-Object System.Drawing.Size(120,100)
    $Form.Controls.Add($TextBox3)
    
    $Button = New-Object System.Windows.Forms.Button
    $Button.Size = New-Object System.Drawing.Size(60,30)
    $Button.Location = New-Object System.Drawing.Size(120,140)
    $Button.Text = "Copy"
    $Button.add_click({Copy-UserProfileController -SourceComputerName $TextBox2.Text -DestComputerName $TextBox3.Text -UserName $TextBox.Text -ResultsLabel $ResultsLabel})
    $Form.Controls.Add($Button)

    $ResultsLabel = New-Object System.Windows.Forms.Label
    $ResultsLabel.Text = "Results"
    $ResultsLabel.Size = New-Object System.Drawing.Size(100,20)
    $ResultsLabel.Location = New-Object System.Drawing.Size(120,180)
    $Form.Controls.Add($ResultsLabel)
    
    $Form.TopMost = $True
    $Form.ShowDialog()
}

View