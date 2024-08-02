terraform {
    backend "s3" {
        bucket = "fanatics-cb-security-registry"
        key    = "services/aws/Inspector/terraform.tfstate"
        region = "us-east-1"
    }
}

provider "aws" {
    region = "us-east-1"
}