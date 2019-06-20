# Set DNS Servers in Windows Clients 
# Created by Haim Cohen

$dnsservers = "8.8.8.8","1.1.1.1"
$computers = Get-Content list.txt
foreach ($comp in $computers)
{

	$adapters = gwmi -q "select * from win32_networkadapterconfiguration where ipenabled='true'" -ComputerName $comp
	foreach ($adapter in $adapters)
	{
		$adapter.setDNSServerSearchOrder($dnsservers)
	}
}