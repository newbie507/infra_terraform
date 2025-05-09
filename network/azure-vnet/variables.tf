variable "vnet_name" {
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "resource_group_location" {
  description = "Resource Group Location"
  type        = string
}

variable "vnet_cidr_block" {
  description = "CIDR block for Azure VNet"
  type        = string
}
variable "public_subnet_cidrs" {
  type = list(string)
}
variable "private_subnet_cidrs" {
  type = list(string)
}
variable "db_subnet_cidrs" {
  type = list(string)
}