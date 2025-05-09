output "azure_resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "azure_vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "location" {
  value = azurerm_resource_group.rg.location
}

output "public_subnet_ids" {
  value = [
    azurerm_subnet.public1.id,
    azurerm_subnet.public2.id
  ]
}

output "private_subnet_ids" {
  value = [
    azurerm_subnet.private1.id,
    azurerm_subnet.private2.id
  ]
}

output "db_subnet_ids" {
  value = [
    azurerm_subnet.db1.id,
    azurerm_subnet.db2.id
  ]
}