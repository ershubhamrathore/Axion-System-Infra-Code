terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.3.0"
    }
  }
  # backend "azurerm" {
  #   resource_group_name  = "rg-devopsinsiders"
  #   storage_account_name = "distoragetf786"
  #   container_name       = "tfstate"
  #   key                  = "preprod.terraform.tfstate"
  # }
}

provider "azurerm" {
  features {}
}