terraform {
   required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.40.0"
    }

    aws = {
      source = "hashicorp/aws"
      version = "3.76.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "storage_account_resource_group"
    storage_account_name = "gaaraujostorageaccount"
    container_name       = "primeirocontainer"
    key                  = "pipeline-azure-devops/terraform.tfstate"
  }
}

data "terraform_remote_state" "vnet" {

  backend = "azurerm"
  config = {
    resource_group_name  = "storage_account_resource_group"
    storage_account_name = "gaaraujostorageaccount"
    container_name       = "primeirocontainer"
    key                  = "azure-vnet/terraform.tfstate"
  }

}

provider "azurerm"{
  features {}
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket     = "gaaraujocursoterraform"
    key        = "aws-vpc/terraform.tfstate"
    region     = "us-east-1"
    encrypt    = true
  }
}

provider "aws" {
  region     = "us-east-1"
  default_tags {
    tags = {
      owner      = "cursoterraform"
      managed-by = "terraform"
    }
  }
}
