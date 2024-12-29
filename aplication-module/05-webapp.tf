resource "azurerm_service_plan" "app-service-plan" {
  name                = "${var.project-name}-asp"
  resource_group_name = azurerm_resource_group.app-rg.name
  location            = azurerm_resource_group.app-rg.location
  os_type             = "Linux"
  sku_name            = "S1"
}

resource "azurerm_linux_web_app" "linux-webapp" {
  name                = "${var.project-name}-app"
  resource_group_name = azurerm_resource_group.app-rg.name
  location            = azurerm_service_plan.app-service-plan.location
  service_plan_id     = azurerm_service_plan.app-service-plan.id
  identity {
    type = "SystemAssigned"
  }

  site_config {}
}


resource "azurerm_app_service_certificate" "certificate" {
  name                = "cert1"
  resource_group_name = azurerm_resource_group.app-rg.name
  location            = azurerm_resource_group.app-rg.location
  key_vault_secret_id = azurerm_key_vault_certificate.certificate.id

  depends_on = [
    azurerm_role_assignment.appsecretreader,azurerm_role_assignment.certificate_contacts_write,azurerm_role_assignment.globalreader,azurerm_role_assignment.webappreader
  ]
}