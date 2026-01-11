<#
.SYNOPSIS
Exports Microsoft 365 / Entra ID user information for audit and reporting.

.DESCRIPTION
Retrieves user attributes and exports them to CSV for
identity audits, operational reporting, and governance reviews.

.NOTES
Originally developed and used in production environments.
Refactored for modular use without changing core logic.
#>

function Export-Users {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]$OutputPath,

        [Parameter(Mandatory)]
        [string]$SharedMailboxName
    )

    if (-not (Test-Path $OutputPath)) {
        New-Item -ItemType Directory -Path $OutputPath | Out-Null
    }

    $timestamp  = Get-Date -Format "yyyyMMdd-HHmmss"
    $outputFile = Join-Path $OutputPath "Users-Audit-$timestamp.csv"

    # === BEGIN ORIGINAL LOGIC ===

    $users = Get-SharedMailboxMembers -SharedMailboxName $SharedMailboxName
    $users | Export-Csv -Path $outputFile -NoTypeInformation

    # === END ORIGINAL LOGIC ===
}
