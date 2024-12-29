resource "azurerm_key_vault" "keyvault" {
  name                        = "${var.project-name}kv01"
  location                    = azurerm_resource_group.app-rg.location
  resource_group_name         = azurerm_resource_group.app-rg.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  purge_protection_enabled    = false
  enable_rbac_authorization          = true


  sku_name = "standard"

}

resource "azurerm_key_vault_certificate_contacts" "contact" {
  key_vault_id = azurerm_key_vault.keyvault.id

  contact {
    email = "example1@example.com"
  }

  depends_on = [
    azurerm_role_assignment.certificate_contacts_write
  ]
}