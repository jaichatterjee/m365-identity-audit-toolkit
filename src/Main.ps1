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
Write-Host "2) Export distribution list members"
Write-Host "3) Export dynamic distribution list members"
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
            Write-Log -Message "Shared mailbox user export completed successfully"
        }

        "2" {
            $outputPath = $AuditConfig.OutputPath
            $dlName = Read-Host "Enter distribution list name"
            Write-Log -Message "Exporting members for DL: $dlName"

            Connect-M365
            Write-Log -Message "Connected to Microsoft 365"

            $data = Get-DistributionListMembers -DLName $dlName
            $csvPath = Join-Path $outputPath "DLMembers-$($dlName)-$(Get-Date -Format 'yyyyMMdd-HHmmss').csv"

            $data | Export-Csv -Path $csvPath -NoTypeInformation
            Write-Log -Message "Distribution list member export completed: $csvPath"
        }

        "3" {
            $outputPath = $AuditConfig.OutputPath
            $ddlName = Read-Host "Enter dynamic distribution list name"
            Write-Log -Message "Exporting members for Dynamic DL: $ddlName"

            Connect-M365
            Write-Log -Message "Connected to Microsoft 365"

            $data = Get-DynamicDLMembers -DDLName $ddlName
            $csvPath = Join-Path $outputPath "DynamicDL-$($ddlName)-$(Get-Date -Format 'yyyyMMdd-HHmmss').csv"

            $data | Export-Csv -Path $csvPath -NoTypeInformation
            Write-Log -Message "Dynamic distribution list export completed: $csvPath"
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
