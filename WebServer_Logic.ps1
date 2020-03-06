param(
     [IO.DirectoryInfo]$root = $PWD.Path
    ,[String[]]$hosts = @("*")
    ,[int[]]$Https = @()
    ,[int[]]$Http = @()
    ,[Switch]$NoFolderListing
) 
$global:restart = $false
$script:listener = $null
$counter = 0

If (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    write-host "Du benötigst Adminrechte um dies auszuführen!"
    return
}

# make sure base folder is a directory
if( !($base= (resolve-path "$($root.FullName)\" -ea 0).Path) ) {
    return write-error "Der Ordner '$root' existiert nicht"
}

function Stop-Listening{
    Get-EventSubscriber | Unregister-Event
    if( $script:listener ) {
        $script:listener.Stop()
        $script:listener = $null
    }
}

function Set-ContentType($ext) {
    $k = [Microsoft.Win32.Registry]::ClassesRoot.OpenSubKey($ext)
    if( $k ) {
        $v = $k.GetValue("Content Type")
        if( $v ) { $script:rs.ContentType=$v }
        $k.Dispose()
    }
}

function Send-Content($content) {
    try {
        $script:rs.ContentLength64 = $content.Length
        $script:rs.OutputStream.Write($content, 0, $content.Length)
        $script:rs.StatusCode = 200
    } catch {
        $script:rs.StatusCode = 500
    }
    finally {
        $script:rs.Close()
    }
}

function Send-Text($content) {
    Send-Content ([System.Text.Encoding]::UTF8.GetBytes($content))
}

function Send-Html($content) {
    Set-ContentType ".html"
    Send-Text "<html><body><pre>$content</pre></body></html>"
}

function Send-DirectoryInfo( $dir, $path) {
    if( $path ) { $path = "/" + $path }
    send-html $(
        "Directory: $dir<br><br>"
        "Mode            Letzte Änderung       Größe           Name<br>"
        "------          -------------------   --------------  ------------------------<br>"
        if( $dir -ne $base ) { "d----- $(''.PadLeft(46))<a href='$path/..'>..</a><br>" }
        dir $dir |% { 
            $each = $_
            switch( $each.GetType() ) {
                ([IO.DirectoryInfo]) { "$($each.Mode)          $($each.LastWriteTime)    $(''.PadLeft(13)) <a href='$path/$($each.Name)'>$($each.Name)</a><br>" }
                ([IO.FileInfo])      { "$($each.Mode)          $($each.LastWriteTime)    $("$($each.length)".PadLeft(13)) <a href='$path/$($each.Name)'>$($each.Name)</a><br>" } 
            }
        }
    )
}

function Send-File($file) {
    Set-ContentType ((dir $file).Extension)
    Send-Content (get-content $file -raw -encoding byte)
}

function Send-404 {
    $script:rs.StatusCode = 404
    $script:rs.Close() 
}

# clean up any leftover listeners
Stop-Listening 

# track if this script changes so we can restart.
$fsw = New-Object IO.FileSystemWatcher $PSScriptRoot, $MyInvocation.MyCommand.Name -Property @{IncludeSubdirectories = $false;NotifyFilter = [IO.NotifyFilters]'FileName, LastWrite';EnableRaisingEvents = $true }
$null = Register-ObjectEvent $fsw Changed -SourceIdentifier FileChanged -Action { $global:restart = $true }

try {
    $script:listener = New-Object System.Net.HttpListener

    # if nothing specified do both on default ports
    if( (-not $Http) -and (-not $Https ) ) { $http = @("80"); $https=@("443") }

    # bind addresses/ports
    $hosts |% { 
        $h = $_
        $http  |% { "http://$($h):$_/" } 
        $https |% { "https://$($h):$_/" } 
    } |% { 
        $script:listener.Prefixes.Add($_)
        Write-Host "Lauscht auf [$_]"
    }
    
    # start listening
    $script:listener.Start()
    $task = $script:listener.GetContextAsync()

    while ($script:listener.IsListening -and (-not $global:restart) )
    {
        # Incoming Request.
        if( $task.IsCompleted ) {
            $requestUrl = $task.Result.Request.Url
            $script:rs = $task.Result.Response
            $task = $script:listener.GetContextAsync()
            
            switch( $path = ($requestUrl.LocalPath) -replace '//','/' ) {
                # handle a few paths manually
                "/about" { Send-Html "MinersWin's PowerShell WebServer<br><br>Source on <a href='https://github.com/MinersWin/PowerShell-WebServer'>github</a><br>Follow me on <a href='https://twitter.com/minerswins'>Twitter</a>" }
                "/quit" {  Send-Html "Verlasse..."; Write-Host "`nQuitting..."; break; }
                "/restart" {Send-Html "Starte neu..."; $global:restart= $true;}
                
                # files or directories
                default {
                    if( ($local = (resolve-path "$base\$path" -ea 0)) ) { 
                        switch((Get-Item $local).GetType() ) { 
                            # makes it easier to add more types later :)
                            ([Io.DirectoryInfo]) { if( $NoFolderListing ) { Send-404 } else { Send-DirectoryInfo $local.Path $path.trim("/") } }
                            ([IO.FileInfo])      { Send-File $local}
                            default { Send-404 }
                        }
                    } else { Send-404 }                            
                }
            } 

            Write-Host "$($script:rs.StatusCode): [$requestUrl] > $local"
        } else {
            [Threading.Thread]::Sleep(1)
            if( ($counter += 0.01) -gt 100 ){
                $counter = 0
            }
            Write-Progress -Activity "Listening..." -PercentComplete $counter -CurrentOperation "Idle..." -Status "Warte auf Anfrage."
        }
    }
} finally { 
    Stop-Listening
} 

if( $global:restart ) {
    Write-Host "`nStarte neu"
    $global:restart = $null
    . "$PSCommandPath" -root $base -hosts $hosts -https $https -http $http -NoFolderListing:$NoFolderListing
} else {
    Write-Host "`nFertig."
}