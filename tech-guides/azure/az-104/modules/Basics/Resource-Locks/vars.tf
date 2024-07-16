# Resource Locks variables
variable "resource_lock_name" {
  description = "Name of the resource lock"
  type        = string
}

variable "notes" {
  description = "Notes for the resource lock"
  type        = string
}

variable "lock_level" {
  description = "Lock level for the resource lock"
  type        = string
}

variable "resource_group_id" {
  description = "ID of the resource group to apply the lock to"
  type        = string
}