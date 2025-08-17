output "url" {
  value = "https://${azurerm_container_app.webui.ingress[0].fqdn}"
  description = "The URL of the Azure Container App Web UI"
}