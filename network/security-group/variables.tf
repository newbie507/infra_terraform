variable "vpc_id" {
  description = "The VPC ID where the security groups will be created"
  type        = string
}

variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
}
