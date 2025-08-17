resource "azurerm_resource_group" "main" {
  location = var.location
  name     = "rg-${local.name_suffix}"
}

resource "azurerm_kubernetes_cluster" "main" {
  location            = azurerm_resource_group.main.location
  name                = "aks-${local.name_suffix}"
  resource_group_name = azurerm_resource_group.main.name
  dns_prefix          = "aks-${local.name_suffix}"

  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name       = "agentpool"
    vm_size    = var.node_size
    node_count = var.node_count
  }

  linux_profile {
    admin_username = var.username

    ssh_key {
      key_data = azapi_resource_action.ssh_public_key_gen.output.publicKey
    }
  }
  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
  }
}
