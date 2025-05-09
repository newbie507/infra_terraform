resource "azurerm_storage_container" "source_container" {
  name                  = "drplan-source-container"
  storage_account_id    = azurerm_storage_account.drplan_storage.id
  container_access_type = "private"
}

resource "azurerm_storage_container" "target_container" {
  name                  = "drplan-target-container"
  storage_account_id    = azurerm_storage_account.drplan_storage.id
  container_access_type = "private"
}

resource "azurerm_storage_account" "drplan_storage" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}