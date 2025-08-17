resource "azurerm_resource_group" "main" {
  name     = "rg-poc-webui-uks"
  location = "uksouth"
}

resource "azurerm_container_app_environment" "main" {
  name                = "cae-poc-uks"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}


resource "azurerm_container_app" "webui" {
  name                         = "ace-poc-webui"
  resource_group_name          = azurerm_resource_group.main.name
  container_app_environment_id = azurerm_container_app_environment.main.id
  revision_mode                = "Single"

  ingress {
    external_enabled = true
    target_port      = 8080
    traffic_weight {
      latest_revision = true
      percentage      = 100
    }
  }

  template {
    container {
      name   = "open-webui"
      image  = "ghcr.io/open-webui/open-webui:ollama"
      cpu    = "2.0"
      memory = "4Gi"
    }
  }
}