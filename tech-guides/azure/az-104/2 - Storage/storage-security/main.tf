locals {
    storage_account_name = "the0xsa"
    blob_container_name = "the0xcontainer"
    file_share_name = "the0xshare"
    table_name = "the0xtable"
    queue_name = "the0xqueue"
}

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

resource "azurerm_storage_container" "the0xcontainer" {
  name                  = "the0xcontainer"
  storage_account_name  = azurerm_storage_account.the0xsa.name
  container_access_type = "blob"
}

resource "azurerm_storage_blob" "howdyblob" {
  name                   = "HowdyBlob"
  storage_account_name   = azurerm_storage_account.the0xsa.name
  storage_container_name = azurerm_storage_container.the0xcontainer.name
  type                   = "Block"
  source                 = "./based.md"
}

output "blob_url" {
  value = azurerm_storage_blob.howdyblob.url
}

output "blob_primary_endpoint" {
  value = azurerm_storage_account.the0xsa.primary_blob_endpoint
}

output "container_primary_endpoint" {
  value = azurerm_storage_account.the0xsa.primary_blob_endpoint
}

output "file_primary_endpoint" {
  value = azurerm_storage_account.the0xsa.primary_file_endpoint
}

output "table_primary_endpoint" {
  value = azurerm_storage_account.the0xsa.primary_table_endpoint
}

output "queue_primary_endpoint" {
  value = azurerm_storage_account.the0xsa.primary_queue_endpoint
}



