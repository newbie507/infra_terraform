terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      configuration_aliases = [ aws.seoul, aws.singapore ]
    }
  }
}

variable "seoul_vpc_id" {
  type = string
}

variable "singapore_vpc_id" {
  type = string
}

resource "aws_vpc_peering_connection" "seoul_singapore" {
  provider    = aws.seoul
  vpc_id      = var.seoul_vpc_id
  peer_vpc_id = var.singapore_vpc_id
  peer_region = "ap-southeast-1"

  tags = {
    Name = "drplan-seoul-singapore-peering"
  }
}

resource "aws_vpc_peering_connection_accepter" "seoul_singapore_accept" {
  provider                  = aws.singapore
  vpc_peering_connection_id = aws_vpc_peering_connection.seoul_singapore.id
  auto_accept               = true

  tags = {
    Name = "drplan-seoul-singapore-peering-accept"
  }
}
