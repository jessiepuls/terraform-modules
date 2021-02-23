locals {
  default_site_config = {
    "always_on"                   = var.service_plan_sku["tier"] == "Free" ? false : true
    "use_32_bit_worker_process"   = var.service_plan_sku["tier"] == "Free" ? true : false
  }
}
