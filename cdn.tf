resource "azurerm_cdn_profile" "cdn" {
    name = "cdn-${var.project}-${var.environment}"
    location = var.location
    resource_group_name = azurerm_resource_group.ec-rg.name
    sku = "Standard_Microsoft"
    tags = var.tags
}

# Endpoint
resource "azurerm_cdn_endpoint" "cdn-endpoint" {
    name = "cdn-endpoint-${var.project}-${var.environment}"
    location = var.location
    resource_group_name = azurerm_resource_group.ec-rg.name
    profile_name = azurerm_cdn_profile.cdn.name
    is_http_allowed = true
    is_https_allowed = true

    origin {
        name = azurerm_storage_account.sa.name
        host_name = azurerm_storage_account.sa.primary_web_endpoint
    }

    tags = var.tags
}