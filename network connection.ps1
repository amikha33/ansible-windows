# Get the current network connection profile
$networkProfile = Get-NetConnectionProfile

# Check if the network is set to Public
if ($networkProfile.NetworkCategory -eq 'Public') {
    # Change the network category to Private
    Set-NetConnectionProfile -Name $networkProfile.Name -NetworkCategory Private
    Write-Host "Network profile changed to Private."
} else {
    Write-Host "Network profile is already set to $($networkProfile.NetworkCategory). No changes made."
}

# Display the updated network connection profile
Get-NetConnectionProfile
