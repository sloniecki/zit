resource "azurerm_resource_group" "app-rg" {
  name     = "app-tls-${var.project-name}-rg"
  location = "West Europe"
}