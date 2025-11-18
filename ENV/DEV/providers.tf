terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.49.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "landingzone"
    storage_account_name = "landingzonestg"
    container_name       = "stgcontainer"
    key                  = "lz.terraform.tfstate"
  }
}
locals {
  backend_address_pool_name = "${each.value.name}-beap"
}
provider "azurerm" {
  features {}
  subscription_id = "70d13209-b5da-483b-9f07-a91b9e1a684b"
   }

