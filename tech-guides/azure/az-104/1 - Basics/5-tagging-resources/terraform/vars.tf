variable "resource_group_name" {
    description = "The name of the resource group"
    default = "the0xsa"
}

variable "location" {
    description = "The location of the resource group"
    default = "eastus"
}

variable "tags" {
    description = "A map of tags to add to the resource group"
    default = {
        environment = "dev"
        costcenter = "it"
    }
}