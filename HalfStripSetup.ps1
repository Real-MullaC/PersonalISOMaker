# Paths
$configFile = "C:\CustomSetup\config_halfstrip.xml"

# Call the shared ISO creation script
& "C:\CustomSetup\CreateISO.ps1" -ConfigPath $configFile -OutputName "HalfStrippedISO.iso"

# Install the common apps
& "C:\CustomSetup\InstallCommonApps.ps1"

Write-Host "Half Stripped ISO created and common apps installed."
