module "basic_storage_account" {
  source = "../../../modules/Basics/Storage-Account"
  storage_account_name = var.storage_account_name
  resource_group_name = var.resource_group_name
  location = var.location
  storage_account_replication_type = var.account_replication_type
  storage_account_tier = var.storage_account_tier
}

module "resource_lock" {
  source = "../../../modules/Basics/Resource-Locks"
  resource_lock_name = var.resource_lock_name
  notes = var.notes
  lock_level = var.lock_level
  resource_group_id = module.basic_storage_account.resource_group_id
}