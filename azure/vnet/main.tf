terraform {
  required_version = ">= 0.14.0"
}

resource "azurerm_resource_group" "resource_group" {
  name     = "${var.vnet_name}-resource-group"
  location = var.location
}

module "vnet" {
  source              = "Azure/vnet/azurerm"
  resource_group_name = azurerm_resource_group.resource_group.name
  address_space       = var.address_space
  subnet_prefixes     = values(var.subnets)
  subnet_names        = keys(var.subnets)

  # route_tables_ids = {
  #   subnet1 = azurerm_route_table.example.id
  #   subnet2 = azurerm_route_table.example.id
  #   subnet3 = azurerm_roiute_table.example.id
  # }

  tags = var.tags
}

resource "azurerm_route_table" "route_table" {
  name                = "${var.vnet_name}-route-table"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
}

# resource "azurerm_subnet_route_table_association" "example" {
#   subnet_id      = azurerm_subnet.example.id
#   route_table_id = azurerm_route_table.example.id
# }

# resource "azurerm_route" "route" {
#   name                = "acceptanceTestRoute1"
#   resource_group_name = azurerm_resource_group.example.name
#   route_table_name    = azurerm_route_table.example.name
#   address_prefix      = "10.1.0.0/16"
#   next_hop_type       = "vnetlocal"
# }