 <#
.SYNOPSIS
    This PowerShell script ensures that the Internet connection sharing is disabled.
.NOTES
    Author          : Gregory Airohi
    LinkedIn        : https://www.linkedin.com/in/gregory-airohi
    GitHub          : https://github.com/Gairohi1
    Date Created    : 2025-20-02
    Last Modified   : 2025-20-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000044

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(WN10-CC-000044).ps1 
#>

# Set the registry value to enable "Prohibit use of Internet Connection Sharing on your DNS domain network"
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\Network Connections" -Name "NC_ShowSharedAccessUI" -Value 0

# Force a Group Policy update
gpupdate /force

# Verify the configuration
$registryValue = Get-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\Network Connections" -Name "NC_ShowSharedAccessUI" -ErrorAction SilentlyContinue
if ($registryValue.NC_ShowSharedAccessUI -eq 0) {
    Write-Host "Policy successfully configured: Internet Connection Sharing is prohibited on the DNS domain network."
} else {
    Write-Host "Policy configuration failed." -ForegroundColor Red
} 
