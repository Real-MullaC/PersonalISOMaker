# Paths
$configFile = "C:\CustomSetup\config_gaming.xml"

# Call the shared ISO creation script
& "C:\CustomSetup\CreateISO.ps1" -ConfigPath $configFile -OutputName "GamingISO.iso"

# Install the common apps
& "C:\CustomSetup\InstallCommonApps.ps1"

Write-Host "Gaming ISO created and common apps installed."
