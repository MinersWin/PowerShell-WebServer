$Form1 = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.Label]$LabelMain = $null
[System.Windows.Forms.Button]$ButtonStart = $null
[System.Windows.Forms.Button]$ButtonRestart = $null
[System.Windows.Forms.Button]$ButtonStop = $null
[System.Windows.Forms.TextBox]$TextBoxPath = $null
[System.Windows.Forms.Label]$LabelPath = $null
[System.Windows.Forms.Button]$ButtonBrowse = $null
[System.Windows.Forms.Button]$Button5 = $null
[System.Windows.Forms.TextBox]$TextBoxHTTPSPort = $null
[System.Windows.Forms.TextBox]$TextBoxHTTPPort = $null
function InitializeComponent
{
$LabelMain = (New-Object -TypeName System.Windows.Forms.Label)
$ButtonStart = (New-Object -TypeName System.Windows.Forms.Button)
$ButtonRestart = (New-Object -TypeName System.Windows.Forms.Button)
$ButtonStop = (New-Object -TypeName System.Windows.Forms.Button)
$TextBoxPath = (New-Object -TypeName System.Windows.Forms.TextBox)
$LabelPath = (New-Object -TypeName System.Windows.Forms.Label)
$ButtonBrowse = (New-Object -TypeName System.Windows.Forms.Button)
$Button5 = (New-Object -TypeName System.Windows.Forms.Button)
$TextBoxHTTPSPort = (New-Object -TypeName System.Windows.Forms.TextBox)
$TextBoxHTTPPort = (New-Object -TypeName System.Windows.Forms.TextBox)
$Form1.SuspendLayout()
#
#LabelMain
#
$LabelMain.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]13.8,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$LabelMain.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]9))
$LabelMain.Name = [System.String]'LabelMain'
$LabelMain.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]432,[System.Int32]31))
$LabelMain.TabIndex = [System.Int32]0
$LabelMain.Text = [System.String]'PowerShell-WebServer Control Panel'
$LabelMain.UseCompatibleTextRendering = $true
#
#ButtonStart
#
$ButtonStart.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]43))
$ButtonStart.Name = [System.String]'ButtonStart'
$ButtonStart.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]75,[System.Int32]23))
$ButtonStart.TabIndex = [System.Int32]1
$ButtonStart.Text = [System.String]'Start'
$ButtonStart.UseCompatibleTextRendering = $true
$ButtonStart.UseVisualStyleBackColor = $true
#
#ButtonRestart
#
$ButtonRestart.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]72))
$ButtonRestart.Name = [System.String]'ButtonRestart'
$ButtonRestart.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]75,[System.Int32]23))
$ButtonRestart.TabIndex = [System.Int32]2
$ButtonRestart.Text = [System.String]'Restart'
$ButtonRestart.UseCompatibleTextRendering = $true
$ButtonRestart.UseVisualStyleBackColor = $true
#
#ButtonStop
#
$ButtonStop.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]101))
$ButtonStop.Name = [System.String]'ButtonStop'
$ButtonStop.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]75,[System.Int32]23))
$ButtonStop.TabIndex = [System.Int32]3
$ButtonStop.Text = [System.String]'Stop'
$ButtonStop.UseCompatibleTextRendering = $true
$ButtonStop.UseVisualStyleBackColor = $true
#
#TextBoxPath
#
$TextBoxPath.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]93,[System.Int32]71))
$TextBoxPath.Name = [System.String]'TextBoxPath'
$TextBoxPath.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]407,[System.Int32]24))
$TextBoxPath.TabIndex = [System.Int32]4
#
#LabelPath
#
$LabelPath.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]93,[System.Int32]45))
$LabelPath.Name = [System.String]'LabelPath'
$LabelPath.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]100,[System.Int32]23))
$LabelPath.TabIndex = [System.Int32]5
$LabelPath.Text = [System.String]'Pfad:'
$LabelPath.UseCompatibleTextRendering = $true
#
#ButtonBrowse
#
$ButtonBrowse.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]506,[System.Int32]71))
$ButtonBrowse.Name = [System.String]'ButtonBrowse'
$ButtonBrowse.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]75,[System.Int32]23))
$ButtonBrowse.TabIndex = [System.Int32]6
$ButtonBrowse.Text = [System.String]'Browse'
$ButtonBrowse.UseCompatibleTextRendering = $true
$ButtonBrowse.UseVisualStyleBackColor = $true
#
#Button5
#
$Button5.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]473,[System.Int32]161))
$Button5.Name = [System.String]'Button5'
$Button5.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]109,[System.Int32]23))
$Button5.TabIndex = [System.Int32]7
$Button5.Text = [System.String]'Stop and Quit'
$Button5.UseCompatibleTextRendering = $true
$Button5.UseVisualStyleBackColor = $true
#
#TextBoxHTTPSPort
#
$TextBoxHTTPSPort.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]160))
$TextBoxHTTPSPort.Name = [System.String]'TextBoxHTTPSPort'
$TextBoxHTTPSPort.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]453,[System.Int32]24))
$TextBoxHTTPSPort.TabIndex = [System.Int32]8
#
#TextBoxHTTPPort
#
$TextBoxHTTPPort.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]130))
$TextBoxHTTPPort.Name = [System.String]'TextBoxHTTPPort'
$TextBoxHTTPPort.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]453,[System.Int32]24))
$TextBoxHTTPPort.TabIndex = [System.Int32]9
#
#Form1
#
$Form1.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]594,[System.Int32]191))
$Form1.Controls.Add($TextBoxHTTPPort)
$Form1.Controls.Add($TextBoxHTTPSPort)
$Form1.Controls.Add($Button5)
$Form1.Controls.Add($ButtonBrowse)
$Form1.Controls.Add($LabelPath)
$Form1.Controls.Add($TextBoxPath)
$Form1.Controls.Add($ButtonStop)
$Form1.Controls.Add($ButtonRestart)
$Form1.Controls.Add($ButtonStart)
$Form1.Controls.Add($LabelMain)
$Form1.Text = [System.String]'PowerShell WebServer by MinersWin'
$Form1.ResumeLayout($false)
$Form1.PerformLayout()
Add-Member -InputObject $Form1 -Name base -Value $base -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name LabelMain -Value $LabelMain -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name ButtonStart -Value $ButtonStart -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name ButtonRestart -Value $ButtonRestart -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name ButtonStop -Value $ButtonStop -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name TextBoxPath -Value $TextBoxPath -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name LabelPath -Value $LabelPath -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name ButtonBrowse -Value $ButtonBrowse -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button5 -Value $Button5 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name TextBoxHTTPSPort -Value $TextBoxHTTPSPort -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name TextBoxHTTPPort -Value $TextBoxHTTPPort -MemberType NoteProperty
}
. InitializeComponent
