 <#
.SYNOPSIS
    This PowerShell script ensures that the system is configured to prevent Internet Control Message Protocol (ICMP) redirects from overriding Open Shortest Path First (OSPF) generated routes.
.NOTES
    Author          : Gregory Airohi
    LinkedIn        : https://www.linkedin.com/in/gregory-airohi
    GitHub          : https://github.com/Gairohi1
    Date Created    : 2025-21-02
    Last Modified   : 2025-21-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000030

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000030).ps1 
#>
# Step 1: Copy ADMX and ADML files
Copy-Item -Path "C:\Path\To\MSS-Legacy.admx" -Destination "C:\Windows\PolicyDefinitions\" -Force
Copy-Item -Path "C:\Path\To\MSS-Legacy.adml" -Destination "C:\Windows\PolicyDefinitions\en-US\" -Force

# Step 2: Set the registry value to disable ICMP redirects
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "EnableICMPRedirect" -Value 0

# Step 3: Force Group Policy update
gpupdate /force

# Step 4: Verify the setting
$value = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "EnableICMPRedirect" -ErrorAction SilentlyContinue
if ($value.EnableICMPRedirect -eq 0) {
    Write-Host "Policy successfully configured: ICMP redirects are disabled."
} else {
    Write-Host "Policy configuration failed." -ForegroundColor Red
} 
