resource "azurerm_resource_group" "main" {
  name     = "rg-${local.suffix}"
  location = var.location
}