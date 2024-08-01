terraform {
    backend "s3" {
        bucket = "the0x"
        key    = "services/cloudflare/terraform.tfstate"
        region = "us-east-1"
    }

    required_providers {
        cloudflare = {
            source = "cloudflare/cloudflare"
            version = "4.34.0"
        }

        aws = {
            source = "hashicorp/aws"
            version = "3.51.0"
        }
    }
}

provider "cloudflare" {
    api_token = var.CLOUDFLARE_API_TOKEN
}

provider "aws" {
    region = "us-east-1"
}