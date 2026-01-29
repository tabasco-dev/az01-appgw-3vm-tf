# Install IIS and deploy index.html
Write-Host "Installing IIS Web Server..."
Install-WindowsFeature -Name Web-Server -IncludeManagementTools

Write-Host "Deploying index.html to wwwroot..."
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$htmlPath = Join-Path $scriptPath "index.html"
$destinationPath = "C:\inetpub\wwwroot\index.html"

if (Test-Path $htmlPath) {
    Copy-Item -Path $htmlPath -Destination $destinationPath -Force
    Write-Host "Successfully deployed index.html to $destinationPath"
} else {
    Write-Error "index.html not found at $htmlPath"
    exit 1
}

Write-Host "IIS installation and HTML deployment completed successfully."
