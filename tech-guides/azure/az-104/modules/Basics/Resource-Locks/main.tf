resource "azure_management_lock" "resource_group_lock" {
    name = var.resource_lock_name
    scope = var.resource_group_id
    notes = var.notes
    lock_level = var.lock_level
}