# InstallApps.ps1

Write-Host "Starting post-installation application installation..."

# List of apps to install
$apps = @(
    "Google.Chrome",
    "VideoLAN.VLC",
    "Notepad++.Notepad++",
    "7zip.7zip",
    "Valve.Steam",
    "Discord.Discord",
    "OBSProject.OBSStudio"
    # Add more app IDs as needed
)

# Install each app using winget
foreach ($app in $apps) {
    Write-Host "Installing $app..."
    winget install -e --id $app
}

Write-Host "Application installation complete."

# Optional: Remove the script after it runs
Remove-Item -Path $PSScriptRoot\InstallApps.ps1 -Force

# Optional: Remove the logon task
schtasks /delete /tn "PostInstallAppSetup" /f
