module "basic_storage_account" {
  source = "../../../modules/Basics/Storage-Account"
  storage_account_name = var.storage_account_name
  resource_group_name = var.resource_group_name
  location = var.location
  storage_account_replication_type = var.account_replication_type
  storage_account_tier = var.storage_account_tier
}

resource "azurerm_storage_container" "blob_container" {
    name                  = "blob-container"
    storage_account_name  = module.basic_storage_account.storage_account_name
    container_access_type = "private"
}

resource "azurerm_billing_account_cost_management_export" "cost_management_export" {
  name                         = "cost-management-export"
  billing_account_id           = "the0x-billing-account"
  recurrence_type              = "Monthly"
  recurrence_period_start_date = "2024-09-18T00:00:00Z"
  recurrence_period_end_date   = "2024-09-19T00:00:00Z"

  export_data_storage_location {
    container_id     = azurerm_storage_container.blob_container.id
    root_folder_path = "/root/updated"
  }

  export_data_options {
    type       = "Usage"
    time_frame = "WeekToDate"
  }
}