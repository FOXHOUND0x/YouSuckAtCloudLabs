output "storage_account_name" {
  value = azurerm_storage_account.the0xsa.name
}

output "resource_group_name" {
  value = azurerm_resource_group.the0xResourceGroup.name
}

output "location" {
  value = azurerm_resource_group.the0xResourceGroup.location
}