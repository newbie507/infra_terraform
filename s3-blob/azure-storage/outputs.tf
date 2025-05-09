output "storage_account_name" {
  value = azurerm_storage_account.drplan_storage.name
}

output "storage_account_url" {
  value = azurerm_storage_account.drplan_storage.primary_blob_endpoint
}

output "source_container_name" {
  value = azurerm_storage_container.source_container.name
}

output "target_container_name" {
  value = azurerm_storage_container.target_container.name
}