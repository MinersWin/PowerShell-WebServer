$MyDir = Split-Path $script:MyInvocation.MyCommand.Path
Add-Type -AssemblyName System.Windows.Forms
. (Join-Path $PSScriptRoot 'WebServer.designer.ps1')
$TextBoxPath.Text = $MyDir
$TextBoxHTTPPort.Text = "HTTP Port eintragen: [80,8080]"
$TextBoxHTTPSPort.Text = "HTTPS Port eintragen [443]"
$ButtonStart.Add_Click{(Start-WebServer)}

$Button5.Add_Click{
    Stop-WebServer
    $Form1.Close()
}
function Stop-WebServer{

}
function Start-WebServer{
    $HTTPPort = $TextBoxHTTPPort.Text
    switch ($HTTPPort){
        "HTTP Port eintragen: [80,8080]" {($HTTPPort = "80,8080")}
        default {($HTTPPort)}
    }
    Write-Host "Der Webserver hört über HTTP auf folgende Ports: $($HTTPPort)"
    $HTTPSPort = $TextBoxHTTPSPort.Text
    switch ($HTTPSPort){
        "HTTPS Port eintragen [443]" {($HTTPSPort = "443")}
        default {($HTTPSPort)}
    }
    Write-Host "Der Webserver hört über HTTP auf folgende Ports: $($HTTPSPort)"
    $Pfad = $TextBoxPath.Text
    Start-Process powershell ".\WebServer_Logic.ps1 -root $($Pfad) -Https $($HTTPSPort) -Http $($HTTPPort)"
}


$Form1.ShowDialog()