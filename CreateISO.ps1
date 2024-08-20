param (
    [string]$ConfigPath,
    [string]$OutputName = "CustomISO.iso"
)

# Define paths
$defaultIsoPath = "C:\CustomSetup\DefaultISO\default.iso"
$isoOutputPath = "C:\CustomSetup\Output"

# Function to copy and modify the default ISO
function Prepare-DefaultISO {
    param (
        [string]$sourceIso,
        [string]$destinationFolder,
        [string]$configPath
    )

    # Extract the default ISO contents to a temp folder
    $tempFolder = "$destinationFolder\temp"
    if (-not (Test-Path $tempFolder)) {
        New-Item -ItemType Directory -Path $tempFolder
    }

    # Use a tool to extract ISO contents (requires third-party tools like 7-Zip)
    & "7z.exe" x $sourceIso -o$tempFolder -y

    # Copy the config file to the temp folder
    Copy-Item -Path $configPath -Destination "$tempFolder\config.xml"

    # Create a new ISO
    $newIsoPath = "$destinationFolder\$OutputName"
    & "oscdimg.exe" -lCUSTOMISO -m -u2 $tempFolder $newIsoPath

    # Clean up the temp folder
    Remove-Item -Recurse -Force $tempFolder

    Write-Host "Custom ISO created at: $newIsoPath"
}

# Call the function to prepare the ISO
Prepare-DefaultISO -sourceIso $defaultIsoPath -destinationFolder $isoOutputPath -configPath $ConfigPath
