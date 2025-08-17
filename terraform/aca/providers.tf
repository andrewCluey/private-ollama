terraform {
  required_version = ">=1.10"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.0"
    }
  }
}

provider "azurerm" {
  features {}
}


# This data source retrieves the Azure client configuration
data "azurerm_client_config" "main" {}

# This data source retrieves the public IP address of the client
data "http" "my_ip" {
  url = "https://api.ipify.org"
}

