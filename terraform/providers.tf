terraform {
  required_version = ">=1.10"

  required_providers {
    azapi = {
      source  = "azure/azapi"
      version = "~>2.5"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.0"
    }
  }
}

provider "azurerm" {
  features {}
}
