variable "resource_group_name" {
  description = "The name of the Azure resource group where the storage account will be created."
  type        = string
}

variable "location" {
  description = "The Azure region where the resources will be deployed."
  type        = string
}

variable "storage_account_name" {
  description = "Azure Storage Account name"
  type        = string
}

variable "source_container_name" {
  description = "Source container name for Blob → S3"
  type        = string
}

variable "target_container_name" {
  description = "Target container name for S3 → Blob"
  type        = string
}