locals {
  default_site_config = {
    "always_on"                 = var.service_plan_sku["tier"] == "Free" ? false : true
    "use_32_bit_worker_process" = var.service_plan_sku["tier"] == "Free" ? true : false
  }

  default_documents = lookup(var.site_config, "default_documents", null) == null ? null : split(" ", var.site_config["default_documents"])
}
