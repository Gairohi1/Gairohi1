 <#
.SYNOPSIS
    This PowerShell script ensures that the machine inactivity limit must be set to 15 minutes, locking the system with the screensaver.

.NOTES
    Author          : Gregory Airohi
    LinkedIn        : https://www.linkedin.com/in/gregory-airohi
    GitHub          : https://github.com/Gairohi1
    Date Created    : 2025-20-02
    Last Modified   : 2025-20-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000070

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\(STIG-ID-WN10-SO-000070).ps1 
#># Define registry path and values
$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
$valueName = "InactivityTimeoutSecs"
$valueData = 900  # Set to 900 seconds (15 minutes) or less, excluding 0

# Ensure the registry path exists
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set the registry value
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type DWord

# Verify the configuration
$setValue = Get-ItemProperty -Path $registryPath -Name $valueName
if ($setValue.$valueName -ge 1 -and $setValue.$valueName -le 900) {
    Write-Output "✅ Machine inactivity limit is set to $($setValue.$valueName) seconds."
} else {
    Write-Output "❌ Failed to set the Machine inactivity limit. Please check manually."
} 
