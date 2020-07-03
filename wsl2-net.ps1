Get-VMNetworkAdapter -VMName * | Disconnect-VMNetworkAdapter
wsl --shutdown
Remove-VMSwitch WSL
Get-NetAdapter # List Net Adapters
Disable-NetAdapterBinding -name "Ethernet" -ComponentID vms_pp
Enable-NetAdapterBinding -name "Ethernet" -ComponentID ms_tcpip
Set-VMSwitch WSL -NetAdapterName "Ethernet"
Enable-NetAdapterBinding -name "vEthernet (WSL)" -ComponentID ms_tcpip
Get-VMNetworkAdapter -VMName * | Connect-VMNetworkAdapter -SwitchName WSL
wsl -d Arch -u root genie -i
