terraform {
  required_version = ">= 0.14.0"
}

resource "azurerm_resource_group" "resource_group" {
  name     = "${var.vnet_name}-resource-group"
  location = var.location
}

resource "azurerm_virtual_network" "coop_vnet" {
  name                = var.vnet_name
  address_space       = var.address_space
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
}

resource "azurerm_subnet" "coop_subnets" {
  for_each             = var.subnets
  name                 = each.key
  resource_group_name  = azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.coop_vnet.name
  address_prefixes     = [each.value]
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