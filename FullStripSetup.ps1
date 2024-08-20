# FullStripSetup.ps1

Write-Host "Starting Fully Stripped ISO Setup..."

# Path to the configuration file
$configFile = "$PSScriptRoot\config_fullstrip.xml"

# Validate config file existence
if (-not (Test-Path $configFile)) {
    Write-Host "Configuration file not found: $configFile"
    exit
}

# Example: Call the ISO creation script
& "$PSScriptRoot\CreateISO.ps1" -ConfigPath $configFile -OutputName "FullyStrippedISO.iso"

# Notify user
Write-Host "Fully Stripped ISO creation complete."

# Optional: Install common apps
& "$PSScriptRoot\InstallCommonApps.ps1"
