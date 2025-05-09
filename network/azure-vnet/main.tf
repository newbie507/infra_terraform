terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

resource "azurerm_resource_group" "rg" {
  provider = azurerm
  name     = "drplan-azure-rg"
  location = "koreacentral"
}

resource "azurerm_virtual_network" "vnet" {
  provider             = azurerm
  name                 = "drplan-azure-vnet"
  address_space        = ["10.20.0.0/16"]
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "public1" {
  provider              = azurerm
  name                  = "drplan-azure-public-subnet-1"
  resource_group_name   = azurerm_resource_group.rg.name
  virtual_network_name  = azurerm_virtual_network.vnet.name
  address_prefixes      = ["10.20.1.0/24"]
}

resource "azurerm_subnet" "public2" {
  provider              = azurerm
  name                  = "drplan-azure-public-subnet-2"
  resource_group_name   = azurerm_resource_group.rg.name
  virtual_network_name  = azurerm_virtual_network.vnet.name
  address_prefixes      = ["10.20.2.0/24"]
}

resource "azurerm_subnet" "private1" {
  provider              = azurerm
  name                  = "drplan-azure-private-subnet-1"
  resource_group_name   = azurerm_resource_group.rg.name
  virtual_network_name  = azurerm_virtual_network.vnet.name
  address_prefixes      = ["10.20.11.0/24"]
}

resource "azurerm_subnet" "private2" {
  provider              = azurerm
  name                  = "drplan-azure-private-subnet-2"
  resource_group_name   = azurerm_resource_group.rg.name
  virtual_network_name  = azurerm_virtual_network.vnet.name
  address_prefixes      = ["10.20.12.0/24"]
}

resource "azurerm_subnet" "db1" {
  provider              = azurerm
  name                  = "drplan-azure-db-subnet-1"
  resource_group_name   = azurerm_resource_group.rg.name
  virtual_network_name  = azurerm_virtual_network.vnet.name
  address_prefixes      = ["10.20.21.0/24"]
}

resource "azurerm_subnet" "db2" {
  provider              = azurerm
  name                  = "drplan-azure-db-subnet-2"
  resource_group_name   = azurerm_resource_group.rg.name
  virtual_network_name  = azurerm_virtual_network.vnet.name
  address_prefixes      = ["10.20.22.0/24"]
}