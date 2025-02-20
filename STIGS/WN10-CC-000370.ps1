 <#
.SYNOPSIS
    This PowerShell script ensures that the convenience PIN for Windows 10 is disabled.

.NOTES
    Author          : Gregory Airohi
    LinkedIn        : https://www.linkedin.com/in/gregory-airohi
    GitHub          : https://github.com/Gairohi1
    Date Created    : 2025-20-02
    Last Modified   : 2025-20-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000370

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\(STIG-ID-WN10-CC-000370).ps1 
#># Define registry path and values
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"
$valueName = "AllowDomainPINLogon"
$valueData = 0  # 0 = Disabled (Prevents PIN sign-in)

# Ensure the registry path exists
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set the registry value to disable PIN sign-in
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type DWord

# Verify the configuration
$setValue = Get-ItemProperty -Path $registryPath -Name $valueName
if ($setValue.$valueName -eq 0) {
    Write-Output "✅ Convenience PIN sign-in has been successfully disabled."
} else {
    Write-Output "❌ Failed to disable convenience PIN sign-in. Please check manually."
}
