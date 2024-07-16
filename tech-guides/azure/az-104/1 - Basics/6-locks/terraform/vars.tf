variable "account_replication_type" {
    default = "LRS"
}

variable "storage_account_tier" {
    default = "Standard"
}

variable "storage_account_name" {
    default = "the0xsa"
}

variable "location" {
    default = "eastus"
}

variable "resource_group_name" {
    default = "the0xResourceGroup"
}

variable "resource_lock_name" {
    default = "the0xResourceLock"
}

variable "notes" {
    default = "This is a lock on the resource group"
}

variable "lock_level" {
    default = "CanNotDelete"
}

variable "resource_group_id" {
    default = "the0xResourceGroup"
}