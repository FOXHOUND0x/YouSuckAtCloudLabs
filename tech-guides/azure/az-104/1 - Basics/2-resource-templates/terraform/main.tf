module "basic_storage_account" {
  source = "../../../modules/Basics/Storage-Account"
  storage_account_name = var.storage_account_name
  resource_group_name = var.resource_group_name
  location = var.location
  storage_account_replication_type = var.account_replication_type
  storage_account_tier = var.storage_account_tier
}

resource "azurerm_resource_group_template_deployment" "the0xDeploymentTemplate" {
    name = "the0xDeploymentTemplate"
    resource_group_name = module.basic_storage_account.resource_group_name
    deployment_mode = "Incremental"
    parameters_content = jsonencode({
        storageAccountName = {
            value = module.basic_storage_account.storage_account_name
        }
        location = {
            value = module.basic_storage_account.location
        }
        resourceGroup = {
            value = module.basic_storage_account.resource_group_name
        }
    })
    template_content = file("./lab-template.json")
}