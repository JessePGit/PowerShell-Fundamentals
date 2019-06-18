Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = '625,500'
$Form.text                       = "Form"
$Form.TopMost                    = $false

$Run                             = New-Object system.Windows.Forms.Button
$Run.BackColor                   = "#4a90e2"
$Run.text                        = "button"
$Run.width                       = 60
$Run.height                      = 30
$Run.location                    = New-Object System.Drawing.Point(475,450)
$Run.Font                        = 'Microsoft Sans Serif,10'

$Close                           = New-Object system.Windows.Forms.Button
$Close.text                      = "button"
$Close.width                     = 60
$Close.height                    = 30
$Close.location                  = New-Object System.Drawing.Point(550,450)
$Close.Font                      = 'Microsoft Sans Serif,10'

$TextBox1                        = New-Object system.Windows.Forms.TextBox
$TextBox1.multiline              = $false
$TextBox1.width                  = 100
$TextBox1.height                 = 20
$TextBox1.location               = New-Object System.Drawing.Point(31,31)
$TextBox1.Font                   = 'Microsoft Sans Serif,10'

$Form.controls.AddRange(@($Run,$Close,$TextBox1))

$Run.Add_Click({ Run })
$Close.Add_Click({ Close })

Function Close {
    $Form.close()
}

Function Run {
    Start-Process Powershell -ArgumentList "Test-NetConnection $($TextBox1.text) -Hops 1; Pause"
}

[void]$Form.ShowDialog()