resource "azurerm_resource_group" "The0xResourceGroup" {
  name     = var.resource_group_name
  location = var.location
  tags = var.tags
}
