resource "azurerm_resource_group" "resource_group" {
  name     = "${var.vnet_name}-resource-group"
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.address_space
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
}

resource "azurerm_subnet" "subnets" {
  for_each             = var.subnets
  name                 = each.key
  resource_group_name  = azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [each.value]
}


resource "azurerm_route_table" "route_table" {
  name                = "${var.vnet_name}-route-table"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
}

resource "azurerm_subnet_route_table_association" "subnet_route_table_associations" {
  for_each       = azurerm_subnet.subnets
  subnet_id      = each.value.id
  route_table_id = azurerm_route_table.route_table.id
}