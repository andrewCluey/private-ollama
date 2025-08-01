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
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~>2.38"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "kubernetes" {
  host                   = azurerm_kubernetes_cluster.main.kube_config[0].host
  client_certificate     = base64decode(azurerm_kubernetes_cluster.main.kube_config[0].client_certificate)
  client_key             = base64decode(azurerm_kubernetes_cluster.main.kube_config[0].client_key)
  cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.main.kube_config[0].cluster_ca_certificate)
}

# This data source retrieves the Azure client configuration
data "azurerm_client_config" "main" {}

# This data source retrieves the public IP address of the client
data "http" "my_ip" {
  url = "https://api.ipify.org"
}

