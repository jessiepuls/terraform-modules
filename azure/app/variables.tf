variable "location" {
  type = string
  default = "East US"
}

variable "tags" {
  type = map
  default = {
    "environment" = "dev"
  }
}

variable "app_name" {
  type = string
  default = "app"
}

variable "service_plan_sku" {
  type = map
  default = {
    tier = "Free",
    size = "F1"
  }
}

variable "app_settings" {
  type = map
  default = null
}

variable "site_config" {
  type = map
  default = null
}