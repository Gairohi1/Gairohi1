<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the display of slide shows on the lock screen must be disabled.
.NOTES
    Author          : Gregory Airohi
    LinkedIn        : https://www.linkedin.com/in/gregory-airohi
    GitHub          : https://github.com/Gairohi1
    Date Created    : 2025-20-02
    Last Modified   : 2025-20-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000010

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\(STIG-ID-WN10-CC-000010).ps1 
#>
# Define registry path and policy value details
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"
$valueName = "NoLockScreenSlideShow"
$valueData = 1  # 1 = Enabled (prevents enabling the lock screen slide show)

# Ensure the registry path exists; create it if it doesn't.
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set the policy value in the registry.
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type DWord

# Verify the configuration.
$setValue = Get-ItemProperty -Path $registryPath -Name $valueName
if ($setValue.$valueName -eq $valueData) {
    Write-Output "✅ 'Prevent enabling lock screen slide show' is set to Enabled."
} else {
    Write-Output "❌ Failed to configure 'Prevent enabling lock screen slide show'. Please check manually."
}
 
