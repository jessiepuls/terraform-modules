output "db_server_name" {
  description = "Database server name"
  value       = azurerm_mysql_server.mysql_server.name
}

output "db_name" {
  description = "Database name"
  value       = azurerm_mysql_database.mysql_database.name
}

output "db_version" {
  description = "Mysql version"
  value       = azurerm_mysql_server.mysql_server.version
}

output "db_fqdn" {
  description = "Fully Qualified Domain Name for the db server"
  value       = azurerm_mysql_server.mysql_server.fqdn
}
