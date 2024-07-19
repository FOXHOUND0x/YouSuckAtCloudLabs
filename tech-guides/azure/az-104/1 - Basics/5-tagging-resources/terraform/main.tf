module "the0xsa" {
    source = "../../../modules/Basics/Resource-Group"

    resource_group_name = var.resource_group_name
    location = var.location
    tags = var.tags
}

