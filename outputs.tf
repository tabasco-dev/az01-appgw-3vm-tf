output "application_gateway_public_ip" {
  description = "Public IP address of the Application Gateway"
  value       = azurerm_public_ip.appgw_pip.ip_address
}

output "application_gateway_fqdn" {
  description = "FQDN of the Application Gateway"
  value       = azurerm_public_ip.appgw_pip.fqdn
}

output "vm_private_ips" {
  description = "Private IP addresses of the VMs"
  value = [
    for nic in azurerm_network_interface.vm_nic : nic.private_ip_address
  ]
}

output "resource_group_name" {
  description = "Name of the resource group"
  value       = azurerm_resource_group.main.name
}
