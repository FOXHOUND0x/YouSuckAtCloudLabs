resource "azuread_application" "the0xapp" {
    display_name = "the0xapp"
}

resource "azuread_service_principal" "the0xsp" {
    client_id = azuread_application.the0xapp.client_id
}

resource "azurerm_role_assignment" "the0xra" {
    scope = azurerm_storage_account.the0xsa.id
    role_definition_name = "Storage Blob Data Contributor"
    principal_id = azuread_service_principal.the0xsp.object_id
}

resource "null_resource" "list_files" {
  provisioner "local-exec" {
    command = <<EOT
STORAGE_ACCOUNT_NAME="${azurerm_storage_account.the0xsa.name}"
FILE_SHARE_NAME="${azurerm_storage_share.the0xstorage_share.name}"
ACCESS_TOKEN=$(az account get-access-token --resource https://storage.azure.com/ --query accessToken -o tsv)

cat $ACCESS_TOKEN
EOT
  }
}