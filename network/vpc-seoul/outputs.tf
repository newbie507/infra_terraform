output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.seoul_vpc.id
}

output "subnet_ids" {
  description = "ID of the created Subnet"
  value = [
    aws_subnet.seoul_subnet_1.id,
    aws_subnet.seoul_subnet_2.id
  ]
}

output "private_subnet_ids" {
  value = [
    aws_subnet.seoul_private_subnet_1.id,
    aws_subnet.seoul_private_subnet_2.id
  ]
}

output "db_subnet_ids" {
  value = [
    aws_subnet.seoul_db_subnet_1.id,
    aws_subnet.seoul_db_subnet_2.id
  ]
}