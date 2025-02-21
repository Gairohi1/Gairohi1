 <#
.SYNOPSIS
    This PowerShell script ensures that the Windows 10 must have command line process auditing events enabled for failures.

.NOTES
    Author          : Gregory Airohi
    LinkedIn        : https://www.linkedin.com/in/gregory-airohi
    GitHub          : https://github.com/Gairohi1
    Date Created    : 2025-21-02
    Last Modified   : 2025-21-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000585

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000585).ps1 
#>
# Set the Audit Process Creation policy to log Failure events
auditpol /set /subcategory:"Process Creation" /failure:enable

# Verify the configuration
$auditSetting = auditpol /get /subcategory:"Process Creation"
if ($auditSetting -match "Failure") {
    Write-Host "Audit Process Creation policy successfully configured to log Failure events."
} else {
    Write-Host "Policy configuration failed." -ForegroundColor Red
} 
