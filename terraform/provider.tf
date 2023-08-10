terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.68.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "test-webapp-1"
    storage_account_name = "webapptfstatefile1"
    container_name       = "webapptfstatefile1"
    key                  = "webapptfstatefile1.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}
