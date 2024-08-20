# Paths
$configFile = "C:\CustomSetup\config_office.xml"

# Call the shared ISO creation script
& "C:\CustomSetup\CreateISO.ps1" -ConfigPath $configFile -OutputName "OfficeISO.iso"

# Install the common apps
& "C:\CustomSetup\InstallCommonApps.ps1"

Write-Host "Office ISO created and common apps installed."
