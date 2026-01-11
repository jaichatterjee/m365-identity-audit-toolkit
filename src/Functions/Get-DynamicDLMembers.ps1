function Get-DynamicDLMembers {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]$DDLName
    )

    $ddl = Get-DynamicDistributionGroup -Identity $DDLName

    $members = Get-Recipient `
        -RecipientPreviewFilter $ddl.RecipientFilter `
        -OrganizationalUnit $ddl.RecipientContainer

    return $members | Select-Object DisplayName, PrimarySmtpAddress
}
