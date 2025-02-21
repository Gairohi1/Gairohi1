 <#
.SYNOPSIS
    This PowerShell script ensures that the PowerShell script block logging is enabled on Windows 10.

.NOTES
    Author          : Gregory Airohi
    LinkedIn        : https://www.linkedin.com/in/gregory-airohi
    GitHub          : https://github.com/Gairohi1
    Date Created    : 2025-20-02
    Last Modified   : 2025-20-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000326

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000326).ps1 
#>
# Define registry path and policy value
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging"
$valueName = "EnableScriptBlockLogging"
$valueData = 1  # 1 = Enabled (Turns on Script Block Logging)

# Ensure the registry path exists
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
    Write-Output "Created registry key: $registryPath"
}

# Set the policy value to enable PowerShell Script Block Logging
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type DWord
Write-Output "Set '$valueName' to '$valueData' (Enabled) in '$registryPath'."

# Verify the configuration
$actualValue = (Get-ItemProperty -Path $registryPath -Name $valueName).$valueName
if ($actualValue -eq $valueData) {
    Write-Output "✅ 'Turn on PowerShell Script Block Logging' is now Enabled."
} else {
    Write-Output "❌ Failed to enable 'Turn on PowerShell Script Block Logging'. Please check manually."
}

# Force a Group Policy update
gpupdate /force
Write-Output "Group Policy update completed."
 
