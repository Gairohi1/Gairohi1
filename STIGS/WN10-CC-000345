 <#
.SYNOPSIS
    This PowerShell script ensures that the Windows Remote Management (WinRM) service does not use Basic authentication.

.NOTES
    Author          : Gregory Airohi
    LinkedIn        : https://www.linkedin.com/in/gregory-airohi
    GitHub          : https://github.com/Gairohi1
    Date Created    : 2025-21-02
    Last Modified   : 2025-21-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000345

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000345).ps1 
#>
# Define registry path and policy value
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service"
$valueName = "AllowBasic"
$valueData = 0  # 0 = Disabled (Basic authentication not allowed)

# Ensure the registry path exists
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
    Write-Output "Created registry key: $registryPath"
}

# Set the policy value to disable Basic authentication
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type DWord
Write-Output "Set '$valueName' to '$valueData' (Disabled) in '$registryPath'."

# Verify the configuration
$actualValue = (Get-ItemProperty -Path $registryPath -Name $valueName).$valueName
if ($actualValue -eq $valueData) {
    Write-Output "✅ 'Allow Basic authentication' in WinRM Service is now Disabled."
} else {
    Write-Output "❌ Failed to disable 'Allow Basic authentication'. Please check manually."
}

# Restart the WinRM service to apply the changes
Write-Output "Restarting WinRM service..."
Restart-Service WinRM -Force

# Force a Group Policy update
gpupdate /force
Write-Output "Group Policy update completed."
