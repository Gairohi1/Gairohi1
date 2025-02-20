 <#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Gregory Airohi
    LinkedIn        : https://www.linkedin.com/in/gregory-airohi
    GitHub          : https://github.com/Gairohi1
    Date Created    : 2025-20-02
    Last Modified   : 2025-20-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000175

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__(WN10-CC-000175).ps1 
#>
# Define registry path and values
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat"
$valueName = "DisableInventory"
$valueData = 1  # 1 = Enabled (Turns off Inventory Collector)

# Ensure the registry path exists
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set the registry value
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type DWord

# Verify the configuration
$setValue = Get-ItemProperty -Path $registryPath -Name $valueName
if ($setValue.$valueName -eq 1) {
    Write-Output "✅ Inventory Collector has been successfully turned off."
} else {
    Write-Output "❌ Failed to disable Inventory Collector. Please check manually."
}
 
