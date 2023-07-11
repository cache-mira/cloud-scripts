# Gets all public IP addresses used by client's Azure cloud services. 
# https://learn.microsoft.com/en-us/azure/cloud-services/cloud-services-connectivity-and-networking-faq#how-can-i-get-the-list-of-public-ips-used-by-my-cloud-services-

$services = Get-AzureService  | Group-Object -Property ServiceName

foreach ($service in $services)
{
    "Cloud Service '$($service.Name)'"

    $deployment = Get-AzureDeployment -ServiceName $service.Name
    "VIP - " +  $deployment.VirtualIPs[0].Address
    "================================="
}
