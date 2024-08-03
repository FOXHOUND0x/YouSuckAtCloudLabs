terraform {
   backend "s3" {
        bucket = "the0x"
        key    = "services/github/terraform.tfstate"
        region = "us-east-1"
    }
  required_providers {
    github = {
      source = "integrations/github"
      version = "6.2.3"
    }
  }
}

provider "github" {}
