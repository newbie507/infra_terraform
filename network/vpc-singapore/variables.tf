variable "vpc_cidr_block" {
  description = "CIDR block for Seoul VPC"
  type        = string
}

variable "subnet_cidr_block" {
  description = "CIDR block for Seoul public subnet"
  type        = string
}

variable "availability_zone" {
  description = "Availability Zone for Seoul subnet"
  type        = string
}

variable "project_name" {
  description = "Project Name used in naming resources"
  type        = string
}