terraform {
  backend "s3" {
    bucket = "unit34"
    key    = "unit34/TheHive/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}