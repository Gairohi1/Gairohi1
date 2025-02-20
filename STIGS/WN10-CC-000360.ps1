<#
.SYNOPSIS
    This PowerShell script ensures that the  Windows Remote Management (WinRM) client must not use Digest authentication.

.NOTES
    Author          : Gregory Airohi
    LinkedIn        : https://www.linkedin.com/in/gregory-airohi
    GitHub          : https://github.com/Gairohi1
    Date Created    : 2025-20-02
    Last Modified   : 2025-20-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000360

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\(STIG-ID-WN10-CC-000360).ps1 
#>
# Define registry path and values
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client"
$valueName = "AllowDigest"
$valueData = 0  # 0 = Enabled (Disallows Digest authentication)

# Ensure the registry path exists
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set the policy value
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type DWord

# Verify the configuration
$setValue = Get-ItemProperty -Path $registryPath -Name $valueName
if ($setValue.$valueName -eq 0) {
    Write-Output "✅ 'Disallow Digest authentication' has been successfully enabled."
} else {
    Write-Output "❌ Failed to enable 'Disallow Digest authentication'. Please check manually."
}

# Force Group Policy update
gpupdate /force
