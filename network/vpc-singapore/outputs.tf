output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.singapore_vpc.id
}

output "subnet_ids" {
  description = "ID of the created Subnet"
  value = [
    aws_subnet.singapore_subnet_1.id,
    aws_subnet.singapore_subnet_2.id
  ]
}

output "private_subnet_ids" {
  value = [
    aws_subnet.singapore_private_subnet_1.id,
    aws_subnet.singapore_private_subnet_2.id
  ]
}

output "db_subnet_ids" {
  value = [
    aws_subnet.singapore_db_subnet_1.id,
    aws_subnet.singapore_db_subnet_2.id
  ]
}