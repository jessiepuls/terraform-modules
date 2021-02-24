resource "azurerm_resource_group" "db_resource_group" {
  name     = "${var.db_name}-db-resources"
  location = var.location
}

resource "azurerm_mysql_server" "mysql_server" {
  name                = var.db_name
  location            = azurerm_resource_group.db_resource_group.location
  resource_group_name = azurerm_resource_group.db_resource_group.name
  version             = var.mysql_version
  sku_name            = var.sku

  administrator_login          = "coop-admin"
  administrator_login_password = azurerm_key_vault_secret.mysql_admin_password.value

  ssl_enforcement_enabled          = true
  ssl_minimal_tls_version_enforced = "TLS1_2"
  storage_mb                       = 5120
}

# resource "azurerm_mysql_database" "example" {
#   name                = "exampledb"
#   resource_group_name = azurerm_resource_group.example.name
#   server_name         = azurerm_mysql_server.example.name
#   charset             = "utf8"
#   collation           = "utf8_unicode_ci"
# }