# ================================
# M365 Identity Audit Toolkit
# Main Orchestrator
# ================================

# Load configuration
. "$PSScriptRoot\Config\config.ps1"

# Load logging
Get-ChildItem "$PSScriptRoot\Logging\*.ps1" -ErrorAction SilentlyContinue |
    ForEach-Object { . $_ }

# Load functions
Get-ChildItem "$PSScriptRoot\Functions\*.ps1" |
    ForEach-Object { . $_ }

Write-Log -Message "M365 Identity Audit Toolkit started"

Write-Host "======================================="
Write-Host " M365 Identity Audit Toolkit"
Write-Host "======================================="
Write-Host "1) Export shared mailbox users"
Write-Host "0) Exit"
Write-Host ""

try {
    $choice = Read-Host "Select an option"

    switch ($choice) {

        "1" {
            $outputPath = $AuditConfig.OutputPath
            Write-Log -Message "Using output path: $outputPath"

            $sharedMailbox = Read-Host "Enter shared mailbox name"
            Write-Log -Message "Selected shared mailbox: $sharedMailbox"

            Connect-M365
            Write-Log -Message "Connected to Microsoft 365"

            Export-Users -OutputPath $outputPath -SharedMailboxName $sharedMailbox
            Write-Log -Message "User export completed successfully"
        }

        "0" {
            Write-Log -Message "User exited the toolkit"
            Write-Host "Exiting..."
            break
        }

        default {
            Write-Log -Message "Invalid menu option selected" -Level "WARN"
            Write-Host "Invalid option selected."
        }
    }
}
catch {
    Write-Log -Message $_ -Level "ERROR"
    throw
}
