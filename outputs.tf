output "public_ip_address" {
  value       = azurerm_public_ip.pip.ip_address
  description = "sdx-vm’in statik Public IP’si"
}
