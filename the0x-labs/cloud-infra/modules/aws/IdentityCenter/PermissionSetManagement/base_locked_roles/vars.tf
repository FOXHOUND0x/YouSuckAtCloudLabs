variable "base_role_name" {
    description = "The base locked roles"
    type = string
}

variable "base_locked_policy" {
    description = "The base locked roles"
    type = string
}

variable "managed_policy_arns" {
    description = "The managed policy arns"
    type = list(string)
}