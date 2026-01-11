function Get-SharedMailboxMembers {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]$SharedMailboxName
    )

    $members = Get-MailboxPermission -Identity $SharedMailboxName |
               Where-Object { $_.User -ne $null }

    return $members.User
}
