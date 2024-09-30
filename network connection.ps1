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

#how to run this script powershell -ExecutionPolicy Bypass -File ChangeNetworkProfile.ps1
#Get python path C:\Users\xxx\AppData\Local\Microsoft\WindowsApps\python.exe
