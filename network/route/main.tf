terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id
  tags = {
    Name = "igw-${var.name}"
  }
}

resource "aws_eip" "nat_eip" {
  domain = "vpc"
  tags = { Name = "nat-eip-${var.name}" }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = var.public_subnet_ids[0] # 첫 번째 퍼블릭 서브넷 사용
  tags = { Name = "nat-${var.name}" }
  depends_on = [aws_internet_gateway.igw]
}

resource "aws_route_table" "public" {
  vpc_id = var.vpc_id
  tags = {
    Name = "public-rt-${var.name}"
  }
}

resource "aws_route" "internet_access" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public_assoc" {
  count          = length(var.public_subnet_ids)
  subnet_id      = var.public_subnet_ids[count.index]
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
  vpc_id = var.vpc_id
  tags = { Name = "private-rt-${var.name}" }
}

resource "aws_route" "nat_route" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id
}

resource "aws_route_table_association" "private_assoc" {
  count          = length(var.private_subnet_ids)
  subnet_id      = var.private_subnet_ids[count.index]
  route_table_id = aws_route_table.private.id
}
