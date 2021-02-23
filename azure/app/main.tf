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

resource "azurerm_app_service" "app_service" {
  name                = "${var.app_name}-app-service"
  location            = azurerm_resource_group.app_resource_group.location
  resource_group_name = azurerm_resource_group.app_resource_group.name
  app_service_plan_id = azurerm_app_service_plan.service_plan.id
  app_settings        = var.app_settings

  dynamic "site_config" {
    for_each = [merge(local.default_site_config, var.site_config)]

    content {
      always_on                   = lookup(site_config.value, "always_on", null)
      app_command_line            = lookup(site_config.value, "app_command_line", null)
      default_documents           = local.default_documents
      dotnet_framework_version    = lookup(site_config.value, "dotnet_framework_version", null)
      ftps_state                  = lookup(site_config.value, "ftps_state", null)
      health_check_path           = lookup(site_config.value, "health_check_path", null)
      http2_enabled               = lookup(site_config.value, "http2_enabled", null)
      ip_restriction              = lookup(site_config.value, "ip_restriction", null)
      scm_use_main_ip_restriction = lookup(site_config.value, "scm_use_main_ip_restriction", null)
      scm_ip_restriction          = lookup(site_config.value, "scm_ip_restriction", null)
      java_container              = lookup(site_config.value, "java_container", null)
      java_container_version      = lookup(site_config.value, "java_container_version", null)
      java_version                = lookup(site_config.value, "java_version", null)
      linux_fx_version            = lookup(site_config.value, "linux_fx_version", null)
      local_mysql_enabled         = lookup(site_config.value, "local_mysql_enabled", null)
      managed_pipeline_mode       = lookup(site_config.value, "managed_pipeline_mode", null)
      min_tls_version             = lookup(site_config.value, "min_tls_version", null)
      php_version                 = lookup(site_config.value, "php_version", null)
      python_version              = lookup(site_config.value, "python_version", null)
      remote_debugging_enabled    = lookup(site_config.value, "remote_debugging_enabled", null)
      remote_debugging_version    = lookup(site_config.value, "remote_debugging_version", null)
      scm_type                    = lookup(site_config.value, "scm_type", null)
      use_32_bit_worker_process   = lookup(site_config.value, "use_32_bit_worker_process", null)
      websockets_enabled          = lookup(site_config.value, "websockets_enabled", null)
      windows_fx_version          = lookup(site_config.value, "windows_fx_version", null)

      dynamic "cors" {
        for_each = lookup(site_config.value, "cors", [])
        content {
          allowed_origins     = cors.value.allowed_origins
          support_credentials = lookup(cors.value, "support_credentials", null)
        }
      }
    }
  }
}
