output "azurerm_linux_virtual_machine_dns_name" {
  value = azurerm_public_ip.mtc-ip.fqdn
}

output "azurerm_linux_virtual_machine_ip_address" {
  value = azurerm_public_ip.mtc-ip.ip_address
}
