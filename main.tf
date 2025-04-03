provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "ec-rg" {
    name = "rg-${var.project}-${var.environment}"
    location = var.location
    tags = var.tags
}