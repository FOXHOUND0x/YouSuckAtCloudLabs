variable "permission_set_name" {
  description = "The name of the permission set"
  type        = string
}

variable "group_id" {
  description = "The ID of the group to assign the permission set to"
  type        = string
}

variable "account_names" {
  description = "The names of the accounts to assign the permission set to"
  type        = list(string)
}

variable "policy_name" {
  description = "The path to the policy file"
  type        = string
}

variable "managed_policy_arn" {
  description = "The path to the policy file"
  type        = string
}