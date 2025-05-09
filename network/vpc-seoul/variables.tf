variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "subnet_cidr_block" {
  description = "CIDR block for the Subnet"
  type        = string
}

variable "availability_zone" {
  description = "Availability Zone for the Subnet"
  type        = string
}

variable "project_name" {
  description = "Project Name used in naming resources"
  type        = string
}