<#
.SYNOPSIS
    This PowerShell script ensures that the Windows PowerShell 2.0 feature is disabled on the system.

.NOTES
    Author          : Gregory Airohi
    LinkedIn        : https://www.linkedin.com/in/gregory-airohi
    GitHub          : https://github.com/Gairohi1
    Date Created    : 2025-20-02
    Last Modified   : 2025-20-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-00-000155

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\(STIG-ID-WN10-00-000155).ps1 
#>
# Check if Windows PowerShell 2.0 is enabled
$featureStatus = Get-WindowsOptionalFeature -Online | Where-Object FeatureName -like "MicrosoftWindowsPowerShellV2*"

if ($featureStatus.State -contains "Enabled") {
    Write-Output "PowerShell 2.0 is enabled. Disabling it now..."
    
    # Disable Windows PowerShell 2.0
    Disable-WindowsOptionalFeature -Online -FeatureName MicrosoftWindowsPowerShellV2Root -NoRestart
    
    # Verify if the feature is disabled
    Start-Sleep -Seconds 5  # Wait for the system to apply changes
    $newFeatureStatus = Get-WindowsOptionalFeature -Online | Where-Object FeatureName -like "MicrosoftWindowsPowerShellV2*"

    if ($newFeatureStatus.State -contains "Disabled") {
        Write-Output "✅ PowerShell 2.0 has been successfully disabled."
    } else {
        Write-Output "❌ PowerShell 2.0 disabling may have failed. Please check manually."
    }
} else {
    Write-Output "✅ PowerShell 2.0 is already disabled. No action required."
}

# Display final feature status
Get-WindowsOptionalFeature -Online | Where-Object FeatureName -like "MicrosoftWindowsPowerShellV2*"
