terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

resource "aws_vpc" "seoul_vpc" {
  provider   = aws
  cidr_block = "10.0.0.0/16"
  tags = { Name = "drplan-seoul-vpc" }
}

resource "aws_subnet" "seoul_subnet_1" {
  provider                  = aws
  vpc_id                    = aws_vpc.seoul_vpc.id
  cidr_block                = "10.0.1.0/24"
  map_public_ip_on_launch   = true
  availability_zone         = "ap-northeast-2a"
  tags = { Name = "drplan-seoul-subnet-1" }
}

resource "aws_subnet" "seoul_subnet_2" {
  provider                  = aws
  vpc_id                    = aws_vpc.seoul_vpc.id
  cidr_block                = "10.0.2.0/24"
  map_public_ip_on_launch   = true
  availability_zone         = "ap-northeast-2c"
  tags = { Name = "drplan-seoul-subnet-2" }
}

resource "aws_subnet" "seoul_private_subnet_1" {
  provider                  = aws
  vpc_id                    = aws_vpc.seoul_vpc.id
  cidr_block                = "10.0.11.0/24"
  map_public_ip_on_launch   = false
  availability_zone         = "ap-northeast-2a"
  tags = { Name = "drplan-seoul-private-subnet-1" }
}

resource "aws_subnet" "seoul_private_subnet_2" {
  provider                  = aws
  vpc_id                    = aws_vpc.seoul_vpc.id
  cidr_block                = "10.0.12.0/24"
  map_public_ip_on_launch   = false
  availability_zone         = "ap-northeast-2c"
  tags = { Name = "drplan-seoul-private-subnet-2" }
}

resource "aws_subnet" "seoul_db_subnet_1" {
  provider                  = aws
  vpc_id                    = aws_vpc.seoul_vpc.id
  cidr_block                = "10.0.21.0/24"
  map_public_ip_on_launch   = false
  availability_zone         = "ap-northeast-2a"
  tags = { Name = "drplan-seoul-db-subnet-1" }
}

resource "aws_subnet" "seoul_db_subnet_2" {
  provider                  = aws
  vpc_id                    = aws_vpc.seoul_vpc.id
  cidr_block                = "10.0.22.0/24"
  map_public_ip_on_launch   = false
  availability_zone         = "ap-northeast-2c"
  tags = { Name = "drplan-seoul-db-subnet-2" }
}