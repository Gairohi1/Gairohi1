 <#
.SYNOPSIS
    This PowerShell script ensures that the system is configured to prevent IP source routing.
AUDIT
.NOTES
    Author          : Gregory Airohi
    LinkedIn        : https://www.linkedin.com/in/gregory-airohi
    GitHub          : https://github.com/Gairohi1
    Date Created    : 2025-20-02
    Last Modified   : 2025-20-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000025

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000025).ps1 
#>
# Step 1: Copy ADMX and ADML files
Copy-Item -Path "C:\Path\To\MSS-Legacy.admx" -Destination "C:\Windows\PolicyDefinitions\" -Force
Copy-Item -Path "C:\Path\To\MSS-Legacy.adml" -Destination "C:\Windows\PolicyDefinitions\en-US\" -Force

# Step 2: Set the registry value for highest protection
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "DisableIPSourceRouting" -Value 2

# Step 3: Force Group Policy update
gpupdate /force

# Step 4: Verify the setting
$value = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "DisableIPSourceRouting" -ErrorAction SilentlyContinue
if ($value.DisableIPSourceRouting -eq 2) {
    Write-Host "Policy successfully configured: IP source routing is completely disabled."
} else {
    Write-Host "Policy configuration failed." -ForegroundColor Red
} 
