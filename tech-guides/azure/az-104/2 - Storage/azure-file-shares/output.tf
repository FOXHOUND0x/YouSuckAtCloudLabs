output "storage_account_name" {
    value = azurerm_storage_account.the0xsa.name
}

output "file_share_name" {
    value = azurerm_storage_share.the0xstorage_share.name
}

output "application_id" {
    value = azuread_application.the0xapp.client_id
}