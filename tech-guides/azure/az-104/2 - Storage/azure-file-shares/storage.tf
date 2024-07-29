resource "azurerm_resource_group" "The0xResourceGroup" {
  name     = "the0xResourceGroup"
  location = "East US"
}


resource "azurerm_storage_account" "the0xsa" {
  depends_on               = [azurerm_resource_group.The0xResourceGroup]
  name                     = "the0xsa"
  resource_group_name      = azurerm_resource_group.The0xResourceGroup.name
  location                 = azurerm_resource_group.The0xResourceGroup.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}


resource "azurerm_storage_share" "the0xstorage_share" {
    name = "the0xstorage-share"
    storage_account_name = azurerm_storage_account.the0xsa.name
    quota = 50
}