function Get-DistributionListMembers {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]$DLName
    )

    $members = Get-DistributionGroupMember -Identity $DLName

    return $members | Select-Object PrimarySmtpAddress
}
