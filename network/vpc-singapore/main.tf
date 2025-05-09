terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

resource "aws_vpc" "singapore_vpc" {
  provider   = aws
  cidr_block = "10.10.0.0/16"
  tags = { Name = "drplan-singapore-vpc" }
}

resource "aws_subnet" "singapore_subnet_1" {
  provider                  = aws
  vpc_id                    = aws_vpc.singapore_vpc.id
  cidr_block                = "10.10.1.0/24"
  map_public_ip_on_launch   = true
  availability_zone         = "ap-southeast-1a"
  tags = { Name = "drplan-singapore-subnet-1" }
}

resource "aws_subnet" "singapore_subnet_2" {
  provider                  = aws
  vpc_id                    = aws_vpc.singapore_vpc.id
  cidr_block                = "10.10.2.0/24"
  map_public_ip_on_launch   = true
  availability_zone         = "ap-southeast-1b"
  tags = { Name = "drplan-singapore-subnet-2" }
}

resource "aws_subnet" "singapore_private_subnet_1" {
  provider                  = aws
  vpc_id                    = aws_vpc.singapore_vpc.id
  cidr_block                = "10.10.11.0/24"
  map_public_ip_on_launch   = false
  availability_zone         = "ap-southeast-1a"
  tags = { Name = "drplan-singapore-private-subnet-1" }
}

resource "aws_subnet" "singapore_private_subnet_2" {
  provider                  = aws
  vpc_id                    = aws_vpc.singapore_vpc.id
  cidr_block                = "10.10.12.0/24"
  map_public_ip_on_launch   = false
  availability_zone         = "ap-southeast-1b"
  tags = { Name = "drplan-singapore-private-subnet-2" }
}

resource "aws_subnet" "singapore_db_subnet_1" {
  provider                  = aws
  vpc_id                    = aws_vpc.singapore_vpc.id
  cidr_block                = "10.10.21.0/24"
  map_public_ip_on_launch   = false
  availability_zone         = "ap-southeast-1a"
  tags = { Name = "drplan-singapore-db-subnet-1" }
}

resource "aws_subnet" "singapore_db_subnet_2" {
  provider                  = aws
  vpc_id                    = aws_vpc.singapore_vpc.id
  cidr_block                = "10.10.22.0/24"
  map_public_ip_on_launch   = false
  availability_zone         = "ap-southeast-1b"
  tags = { Name = "drplan-singapore-db-subnet-2" }
}