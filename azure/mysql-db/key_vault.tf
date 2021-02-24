data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "mysql_key_vault" {
  name                        = "${var.db_name}-key-vault"
  location                    = azurerm_resource_group.db_resource_group.location
  resource_group_name         = azurerm_resource_group.db_resource_group.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    # storage_permissions = [
    #   "Get",
    # ]
  }
}

resource "random_password" "mysql_admin_password" {
  length = 20
  special = true
}

resource "azurerm_key_vault_secret" "mysql_admin_password" {
  name         = "mysql-admin-password"
  value        = random_password.mysql_admin_password.result
  key_vault_id = azurerm_key_vault.mysql_key_vault.id
}