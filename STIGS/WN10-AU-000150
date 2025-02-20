 <#
.SYNOPSIS
    This PowerShell script ensures that the system must be configured to audit System - Security System Extension successes.

.NOTES
    Author          : Gregory Airohi
    LinkedIn        : https://www.linkedin.com/in/gregory-airohi
    GitHub          : https://github.com/Gairohi1
    Date Created    : 2025-20-02
    Last Modified   : 2025-20-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000150

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\(STIG-ID-WN10-AU-000150).ps1 
#>
# Enable "Audit Security System Extension" for Success events
AuditPol /set /category:"System" /subcategory:"Security System Extension" /success:enable

# Verify the configuration
AuditPol /get /category:"System" /subcategory:"Security System Extension"
 
