function Connect-M365 {
    [CmdletBinding()]
    param ()

    try {
        Write-Host "Connecting to Microsoft 365 (Exchange Online)..."
        Connect-ExchangeOnline -ShowBanner:$false
        Write-Host "Connection successful."
    }
    catch {
        Write-Error "Failed to connect to Microsoft 365. $_"
        throw
    }
}
