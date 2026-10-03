# Outputs exposed after terraform apply

output "resource_group_name" {
  description = "Name of the created Resource Group"
  value       = azurerm_resource_group.main.name
}

output "resource_group_location" {
  description = "Azure region of the Resource Group"
  value       = azurerm_resource_group.main.location
}

output "vnet_id" {
  description = "ID of the Virtual Network"
  value       = azurerm_virtual_network.main.id
}

output "vnet_name" {
  description = "Name of the Virtual Network"
  value       = azurerm_virtual_network.main.name
}

output "vnet_cidr" {
  description = "CIDR block of the Virtual Network"
  value       = azurerm_virtual_network.main.address_space
}

output "subnet_ids" {
  description = "IDs of the created subnets"
  value       = azurerm_subnet.main[*].id
}

output "subnet_names" {
  description = "Names of the created subnets"
  value       = azurerm_subnet.main[*].name
}

output "nsg_id" {
  description = "ID of the Network Security Group"
  value       = azurerm_network_security_group.app.id
}

output "subscription_id" {
  description = "Azure Subscription ID used"
  value       = var.subscription_id
}