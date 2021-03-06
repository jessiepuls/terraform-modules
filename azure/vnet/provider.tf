terraform {
  required_version = ">= 0.14.0"
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.47.0"
    }
  }
}

provider "azurerm" {
  features {}
}