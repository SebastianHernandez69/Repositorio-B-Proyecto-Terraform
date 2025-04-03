resource "azurerm_service_plan" "sp-fo" {
    name = "sp-${var.project}-${var.environment}-fo"
    location = var.location
    resource_group_name = azurerm_resource_group.ec-rg.name
    sku_name = "B1"
    os_type = "Linux"
    tags = var.tags
}

resource "azurerm_linux_web_app" "webapp-api-fo" {
    name = "api-fo-${var.project}-${var.environment}"
    location = var.location
    resource_group_name = azurerm_resource_group.ec-rg.name
    service_plan_id = azurerm_service_plan.sp-fo.id
    site_config {
        always_on = true
        application_stack {
            docker_registry_url = "https://index.docker.io"
            docker_image_name = "nginx:latest"
        }
    }
    app_settings = {
        WEBSITE_PORT = "80"
    }
    tags = var.tags
}

resource "azurerm_linux_web_app" "webapp-ui-fo" {
    name = "ui-fo-${var.project}-${var.environment}"
    location = var.location
    resource_group_name = azurerm_resource_group.ec-rg.name
    service_plan_id = azurerm_service_plan.sp-fo.id
    site_config {
        always_on = true
        application_stack {
            docker_registry_url = "https://index.docker.io"
            docker_image_name = "nginx:latest"
        }
    }
    app_settings = {
        WEBSITE_PORT = "80"
    }
    tags = var.tags
}