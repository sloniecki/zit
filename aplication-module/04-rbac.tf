resource "azurerm_role_assignment" "certificate_contacts_write" {
  scope                = azurerm_key_vault.keyvault.id
  role_definition_name = "Key Vault Certificates Officer" 
  principal_id         = data.azurerm_client_config.current.object_id

    depends_on = [
    azurerm_key_vault.keyvault
  ]
}

resource "azurerm_role_assignment" "webappreader" {
  scope                = azurerm_key_vault.keyvault.id
  role_definition_name = "Key Vault Certificates Officer" 
  principal_id         = azurerm_linux_web_app.linux-webapp.identity[0].principal_id

    depends_on = [
    azurerm_key_vault.keyvault, azurerm_linux_web_app.linux-webapp
  ]
}
resource "azurerm_role_assignment" "appsecretreader" {
  scope                = azurerm_key_vault.keyvault.id
  role_definition_name = "Key Vault Secrets User" 
  principal_id         = azurerm_linux_web_app.linux-webapp.identity[0].principal_id

    depends_on = [
    azurerm_key_vault.keyvault, azurerm_linux_web_app.linux-webapp
  ]
}
resource "azurerm_role_assignment" "globalreader" {
  scope                = azurerm_key_vault.keyvault.id
  role_definition_name = "Key Vault Secrets User" 
  principal_id         = "e17522b7-4765-499e-a25c-74678fd1639f"

    depends_on = [
    azurerm_key_vault.keyvault, azurerm_linux_web_app.linux-webapp
  ]
}