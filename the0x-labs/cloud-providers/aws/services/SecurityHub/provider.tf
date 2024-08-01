terraform {
    backend "s3" {
        bucket = "fanatics-cb-security-registry"
        key    = "services/aws/securityhub/terraform.tfstate"
        region = "us-east-1"
    }
}

provider "aws" {
    region = "us-east-1"
    assume_role {
        role_arn     = "arn:aws:iam::954093664884:role/securityhub-admin"
        session_name = "security-registry-security-hub-operation"
        external_id  = "security-registry-security-hub-operation"
    }
}
