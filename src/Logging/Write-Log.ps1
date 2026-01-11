function Write-Log {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]$Message,

        [ValidateSet("INFO", "WARN", "ERROR")]
        [string]$Level = "INFO"
    )

    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logLine = "$timestamp [$Level] $Message"

    Write-Host $logLine

    if ($Global:AuditConfig.LogPath) {
        if (-not (Test-Path $Global:AuditConfig.LogPath)) {
            New-Item -ItemType Directory -Path $Global:AuditConfig.LogPath | Out-Null
        }

        Add-Content -Path (Join-Path $Global:AuditConfig.LogPath "audit.log") -Value $logLine
    }
}
