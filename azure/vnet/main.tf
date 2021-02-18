terraform {
  required_version = ">= 0.14.0"
}

# The simplest possible Terraform module: it just outputs "Hello, World!"
output "hello_world" {
  value = "Hello, World!"
}