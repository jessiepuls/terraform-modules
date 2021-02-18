terraform {
  required_version = ">= 0.14.0"
}

resource "azurerm_resource_group" "resource_group" {
  name     = "${var.vnet_name}-resource-group"
  location = var.location
}