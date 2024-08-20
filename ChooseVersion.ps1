# GUI for selecting version
Add-Type -AssemblyName PresentationFramework

# Create the main window
$Window = New-Object system.windows.window
$Window.Title = "Choose ISO Version"
$Window.Width = 300
$Window.Height = 250
$Window.WindowStartupLocation = "CenterScreen"

# Create a StackPanel to arrange buttons
$StackPanel = New-Object System.Windows.Controls.StackPanel
$StackPanel.Orientation = "Vertical"
$StackPanel.HorizontalAlignment = "Center"
$StackPanel.VerticalAlignment = "Center"
$Window.Content = $StackPanel

# Define the button creation function
function Create-Button {
    param (
        [string]$Content,
        [string]$ScriptName
    )
    $Button = New-Object System.Windows.Controls.Button
    $Button.Content = $Content
    $Button.Width = 200
    $Button.Height = 40
    $StackPanel.Children.Add($Button)
    $Button.Add_Click({
        Write-Host "Selected: $ScriptName"
        $ScriptPath = Join-Path -Path $PSScriptRoot -ChildPath $ScriptName

        if (-Not (Test-Path $ScriptPath)) {
            Write-Host "Script not found: $ScriptPath"
            [System.Windows.MessageBox]::Show("Script not found: $ScriptName", "Error", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Error)
            return
        }

        try {
            # Set execution policy temporarily
            Set-ExecutionPolicy Bypass -Scope Process -Force
            
            # Run the selected script
            & "$ScriptPath"
            Write-Host "$ScriptName executed successfully."
            [System.Windows.MessageBox]::Show("$ScriptName executed successfully.", "Info", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Information)
        } catch {
            Write-Host "An error occurred: $_"
            [System.Windows.MessageBox]::Show("An error occurred: $_", "Error", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Error)
        }
        # Do not close the application automatically
    })
}

# Add buttons for each ISO version
Create-Button -Content "Fully Stripped ISO" -ScriptName "FullStripSetup.ps1"
Create-Button -Content "Half Stripped ISO" -ScriptName "HalfStripSetup.ps1"
Create-Button -Content "Gaming ISO" -ScriptName "GamingSetup.ps1"
Create-Button -Content "Minimal ISO" -ScriptName "MinimalSetup.ps1"
Create-Button -Content "Office ISO" -ScriptName "OfficeSetup.ps1"

# Show the window
$Window.ShowDialog()
