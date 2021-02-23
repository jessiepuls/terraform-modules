terraform {
  required_version = ">= 0.14.0"
}

resource "azurerm_resource_group" "app_resource_group" {
  name     = "${var.app_name}-resources"
  location = var.location
}

resource "azurerm_app_service_plan" "service_plan" {
  name                = "${var.app_name}-app-service-plan"
  location            = azurerm_resource_group.app_resource_group.location
  resource_group_name = azurerm_resource_group.app_resource_group.name

  sku {
    tier = var.service_plan_sku["tier"]
    size = var.service_plan_sku["size"]
  }
}