variable "location" {
  type = string
  default = "East US"
}

variable "vnet_name" {
  type = string
  default = "coop-vnet"
}

variable "environment" {
  type = string
  default = "dev"
}

variable "tags" {
  type = map
  default = {
    "environment" = "dev"
  }
}

variable "address_space" {
  type = list
  default = ["10.0.0.0/16"]
}

variable "subnets" {
  type = map
  default = {
    "subnet1" = "10.0.1.0/24",
    "subnet2" = "10.0.2.0/24",
    "subnet3" = "10.0.3.0/24",
  }
}