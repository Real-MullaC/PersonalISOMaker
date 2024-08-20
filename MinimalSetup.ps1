# Paths
$configFile = "C:\CustomSetup\config_minimal.xml"

# Call the shared ISO creation script
& "C:\CustomSetup\CreateISO.ps1" -ConfigPath $configFile -OutputName "MinimalISO.iso"

# Install the common apps
& "C:\CustomSetup\InstallCommonApps.ps1"

Write-Host "Minimal ISO created and common apps installed."
