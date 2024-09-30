1. Enable WinRM and Configure the Listener
Run these commands in PowerShell as Administrator to enable WinRM and configure the necessary settings:

powershell
Copy code
# Enable PowerShell Remoting
Enable-PSRemoting -Force

# Set up basic WinRM configuration
winrm quickconfig

# Allow unencrypted traffic (optional, depends on your setup)
winrm set winrm/config/service @{AllowUnencrypted="true"}

# Enable basic authentication
winrm set winrm/config/service/auth @{Basic="true"}
2. Check the WinRM Listener
This command verifies that a WinRM listener is set up and active on the correct port (5985 for HTTP or 5986 for HTTPS):

powershell
Copy code
# Verify the WinRM listener
winrm enumerate winrm/config/listener
You should see output indicating that the listener is configured for HTTP on port 5985.

3. Allow WinRM Through the Firewall
If WinRM is not already allowed through the firewall, you can use this command to create an exception for WinRM (for HTTP on port 5985):

powershell
Copy code
# Allow WinRM through Windows Firewall
New-NetFirewallRule -Name "Allow WinRM" -DisplayName "Allow WinRM" -Enabled True -Profile Any -Action Allow -Direction Inbound -Protocol TCP -LocalPort 5985
4. Enable ICMP (Ping) in Windows Firewall
To enable ping (ICMP requests) through the Windows Firewall, use this PowerShell command:

powershell
Copy code
# Enable ICMPv4 (Ping) through the firewall
Enable-NetFirewallRule -Name "FPS-ICMP4-ER-In"
This will allow incoming ping requests (ICMPv4) on the Windows machine.

5. (Optional) Temporarily Disable the Firewall for Testing
If you want to temporarily disable the firewall completely for testing purposes, you can use the following command:

powershell
Copy code
# Disable the firewall (for all profiles)
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
After testing, you can re-enable the firewall with this command:

powershell
Copy code
# Re-enable the firewall
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True
6. Restart the WinRM Service
After making changes, restart the WinRM service to ensure the settings take effect:

powershell
Copy code
# Restart the WinRM service
Restart-Service winrm
Summary of PowerShell Commands:
Enable PowerShell remoting and configure WinRM:
powershell
Copy code
Enable-PSRemoting -Force
winrm quickconfig
winrm set winrm/config/service @{AllowUnencrypted="true"}
winrm set winrm/config/service/auth @{Basic="true"}
Verify the listener:
powershell
Copy code
winrm enumerate winrm/config/listener
Allow WinRM through the firewall:
powershell
Copy code
New-NetFirewallRule -Name "Allow WinRM" -DisplayName "Allow WinRM" -Enabled True -Profile Any -Action Allow -Direction Inbound -Protocol TCP -LocalPort 5985
Enable ping (ICMP) through the firewall:
powershell
Copy code
Enable-NetFirewallRule -Name "FPS-ICMP4-ER-In"
These steps should configure the Windows machine to allow connectivity from your Ansible control node. Let me know if you encounter any issues!






