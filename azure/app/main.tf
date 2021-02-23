terraform {
  required_version = ">= 0.14.0"
}

resource "azurerm_resource_group" "app_resource_group" {
  name     = "${var.app_name}-resources"
  location = var.location
}
