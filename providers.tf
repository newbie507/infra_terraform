provider "aws" {
  alias  = "seoul"
  region = "ap-northeast-2"
}

provider "aws" {
  alias  = "singapore"
  region = "ap-southeast-1"
}

provider "aws" {
  alias  = "us_east"
  region = "us-east-1"
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id
  client_secret   = var.client_secret
}