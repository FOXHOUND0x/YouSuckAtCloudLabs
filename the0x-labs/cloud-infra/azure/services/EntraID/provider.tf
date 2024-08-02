terraform {
    backend "s3" {
        bucket = "the0x"
        key    = "services/azure/EntraID/terraform.tfstate"
        region = "us-east-1"
    }

    required_providers {
        azuread = {
            source  = "hashicorp/azuread"
            version = "~> 2.15.0"
        }

        aws = {
            source  = "hashicorp/aws"
            version = "~> 5.0"
        }
    }
}

provider "aws" {
    region = "us-east-1"
}

provider "azuread" {
  tenant_id = var.AZURE_TENANT_ID
}

