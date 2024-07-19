module "basic_storage_account" {
  source = "../../../modules/Basics/Storage-Account"
  storage_account_name = var.storage_account_name
  resource_group_name = var.resource_group_name
  location = var.location
  storage_account_replication_type = var.account_replication_type
  storage_account_tier = var.storage_account_tier
}