terraform {
  required_version = ">= 1.0.0"
}

module "vpc_seoul" {
  source = "./network/vpc-seoul"
  providers = {
    aws = aws.seoul
  }

  vpc_cidr_block        = "10.0.0.0/16"
  subnet_cidr_block     = "10.0.1.0/24"
  availability_zone     = "ap-northeast-2a"
  project_name          = "drplan"
}

module "vpc_singapore" {
  source = "./network/vpc-singapore"
  providers = {
    aws = aws.singapore
  }

  vpc_cidr_block        = "10.10.0.0/16"
  subnet_cidr_block     = "10.10.1.0/24"
  availability_zone     = "ap-southeast-1a"
  project_name          = "drplan"
}


module "vpc_peering" {
  source = "./network/vpc-peering"
  providers = {
    aws.seoul     = aws.seoul
    aws.singapore = aws.singapore
  }
  seoul_vpc_id     = module.vpc_seoul.vpc_id
  singapore_vpc_id = module.vpc_singapore.vpc_id
}

module "route_seoul" {
  source              = "./network/route"
  providers = {
    aws = aws.seoul
  }
  vpc_id              = module.vpc_seoul.vpc_id
  public_subnet_ids   = module.vpc_seoul.subnet_ids
  private_subnet_ids  = module.vpc_seoul.private_subnet_ids
  name                = "seoul"
}

module "route_singapore" {
  source              = "./network/route"
  providers = {
    aws = aws.singapore
  }
  vpc_id              = module.vpc_singapore.vpc_id
  public_subnet_ids   = module.vpc_singapore.subnet_ids
  private_subnet_ids  = module.vpc_singapore.private_subnet_ids
  name                = "singapore"
}

module "security_group_seoul" {
  source     = "./network/security-group"
  providers = {
    aws = aws.seoul
  }
  vpc_id     = module.vpc_seoul.vpc_id
  name_prefix = "seoul"
}

module "security_group_singapore" {
  source     = "./network/security-group"
  providers = {
    aws = aws.singapore
  }
  vpc_id     = module.vpc_singapore.vpc_id
  name_prefix = "singapore"
}

module "azure_vnet" {
  source = "./network/azure-vnet"
  
  vnet_name             = "drplan-azure-vnet"
  resource_group_name     = "drplan-azure-rg"
  resource_group_location = "korea-central"


  vnet_cidr_block       = "10.20.0.0/16"
  public_subnet_cidrs   = ["10.20.1.0/24", "10.20.2.0/24"]
  private_subnet_cidrs  = ["10.20.11.0/24", "10.20.12.0/24"]
  db_subnet_cidrs       = ["10.20.21.0/24", "10.20.22.0/24"]
}

module "aws_s3" {
  source                           = "./s3-blob/aws-s3"
  s3_bucket_name                  = var.s3_bucket_name
  blob_to_s3_target_bucket_name   = var.blob_to_s3_target_bucket_name
}

module "azure_storage" {
  source                   = "./s3-blob/azure-storage"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  storage_account_name     = var.storage_account_name
  source_container_name    = var.source_container_name
  target_container_name    = var.target_container_name
}
# AWS ECR - 서울 리전
module "aws_ecr_seoul" {
  source = "./repo/ecr"

  providers = {
    aws = aws.seoul
  }

  name = "drplan-ecr-seoul-repo"
}

# AWS ECR - 싱가포르 리전
module "aws_ecr_singapore" {
  source = "./repo/ecr"

  providers = {
    aws = aws.singapore
  }

  name = "drplan-ecr-singapore-repo"
}

# Azure ACR - 코리아 중앙
module "azure_acr" {
  source = "./repo/acr"

  name                = "drplanacrrepo"
  resource_group_name = "drplan-azure-rg"
  location            = "koreacentral"
}


