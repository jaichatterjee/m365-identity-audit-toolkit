# Load configuration
. "$PSScriptRoot\Config\config.ps1"

# Load logging (placeholder for future)
Get-ChildItem "$PSScriptRoot\Logging\*.ps1" -ErrorAction SilentlyContinue |
    ForEach-Object { . $_ }

# Load functions
Get-ChildItem "$PSScriptRoot\Functions\*.ps1" |
    ForEach-Object { . $_ }

Write-Host "======================================="
Write-Host " M365 Identity Audit Toolkit"
Write-Host "======================================="
Write-Host "1) Export shared mailbox users"
Write-Host "0) Exit"
Write-Host ""

$choice = Read-Host "Select an option"

switch ($choice) {
    "1" {
        $outputPath = Read-Host "Enter output folder path"
        $sharedMailbox = Read-Host "Enter shared mailbox name"

        Connect-M365
        Export-Users -OutputPath $outputPath -SharedMailboxName $sharedMailbox
    }
    "0" {
        Write-Host "Exiting..."
        break
    }
    default {
        Write-Host "Invalid option selected."
    }
}

