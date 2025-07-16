output "public_ip_address" {
  value       = azurerm_public_ip.pip.ip_address
  description = "IP of sdx-vm "
}
