variable "name" {
    default = "tagging-policy"
}
variable "policy_type" {
    default = "Custom"
}
variable "mode" {
    default = "Indexed"
}

variable "display_name" {
    default = "Tagging Policy"
}

variable "description" {
    default = "This policy ensures that all resources are tagged with a specific tag."
}

variable "scope" {
    default = "/subscriptions/00000000-0000-0000-0000-000000000000"
}

variable "tag_name" {
    default = "environment"
}