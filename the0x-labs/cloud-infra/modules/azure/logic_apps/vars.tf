variable "resource_group_name" {
  description = "The name of the resource group in which to create the logic app."
  type        = string
}

variable "location" {
  description = "The location of the resource group in which to create the logic app."
  type        = string
}

variable "logic_app_name" {
  description = "The name of the logic app."
  type        = string
}
