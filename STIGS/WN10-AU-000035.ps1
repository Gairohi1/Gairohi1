 <#
.SYNOPSIS
    This PowerShell script ensures that the system is configured to audit Account Management - User Account Management failures.

.NOTES
    Author          : Gregory Airohi
    LinkedIn        : https://www.linkedin.com/in/gregory-airohi
    GitHub          : https://github.com/Gairohi1
    Date Created    : 2025-21-02
    Last Modified   : 2025-21-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000035

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000035).ps1 
#>
# Set the Audit User Account Management policy to log Failure events
auditpol /set /subcategory:"User Account Management" /failure:enable

# Verify the configuration
$auditSetting = auditpol /get /subcategory:"User Account Management"
if ($auditSetting -match "Failure") {
    Write-Host "Audit User Account Management policy successfully configured to log Failure events."
} else {
    Write-Host "Policy configuration failed." -ForegroundColor Red
}
