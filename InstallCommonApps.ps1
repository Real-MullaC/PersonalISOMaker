# Define the common applications to install
$commonApps = @(
    "Google.Chrome",
    "Mozilla.Firefox",
    "7zip.7zip",
    "Adobe.Reader",
    "Microsoft.VisualStudioCode",
    "VLC.VLC"
)

# Function to install apps using winget
function Install-Apps {
    param (
        [array]$apps
    )

    foreach ($app in $apps) {
        Write-Host "Installing $app..."
        winget install --id $app --silent --accept-package-agreements --accept-source-agreements
    }
}

# Install the common apps
Install-Apps -apps $commonApps
