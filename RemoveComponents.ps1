# List of components to remove for Fully Stripped Version
$fullStripComponents = @(
    "Microsoft.Windows.SecHealthUI", # Windows Defender
    "Microsoft.MicrosoftOfficeHub",
    "Microsoft.OneConnect",
    "Microsoft.People",
    "Microsoft.SkypeApp",
    "Microsoft.StorePurchaseApp",
    "Microsoft.XboxApp",
    "Microsoft.XboxGameOverlay",
    "Microsoft.XboxGamingOverlay",
    "Microsoft.XboxIdentityProvider",
    "Microsoft.XboxSpeechToTextOverlay",
    "Microsoft.ZuneMusic",
    "Microsoft.ZuneVideo"
)

# List of components to remove for Half Stripped Version
$halfStripComponents = @(
    "Microsoft.MicrosoftOfficeHub",
    "Microsoft.OneConnect",
    "Microsoft.People",
    "Microsoft.SkypeApp",
    "Microsoft.StorePurchaseApp",
    "Microsoft.XboxApp",
    "Microsoft.ZuneMusic",
    "Microsoft.ZuneVideo"
)

# Function to remove components
function Remove-Components {
    param (
        [array]$components
    )

    foreach ($component in $components) {
        Write-Host "Removing $component..."
        Get-AppxPackage -AllUsers -Name $component | Remove-AppxPackage -ErrorAction SilentlyContinue
        Get-AppxProvisionedPackage -Online | Where-Object DisplayName -EQ $component | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue
    }

    # Remove Windows Defender
    Write-Host "Removing Windows Defender..."
    & "powershell.exe" -Command "Uninstall-WindowsFeature -Name Windows-Defender-Features -Remove"
    Write-Host "Windows Defender removed."
}

# Call Remove-Components with the appropriate list
param (
    [bool]$usingFullStrip = $false
)

if ($usingFullStrip) {
    Remove-Components -components $fullStripComponents
} else {
    Remove-Components -components $halfStripComponents
}
