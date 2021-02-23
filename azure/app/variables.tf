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