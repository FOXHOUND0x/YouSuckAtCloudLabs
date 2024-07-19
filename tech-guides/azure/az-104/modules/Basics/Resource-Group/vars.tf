variable "storage_account_replication_type" {
  description = "The replication type of the storage account"
  default = "LRS"
}

variable "storage_account_tier" {
  description = "The tier of the storage account"
  default = "Standard"
}

variable "storage_account_name" {
  description = "The name of the storage account"
  default = "the0xsa"
}

variable "location" {
  description = "The location of the storage account"
  default = "eastus"
}

variable "resource_group_name" {
  description = "The name of the resource group"
  default = "the0xsa"
}

variable "tags" {}