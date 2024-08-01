terraform {
  backend "s3" {
    bucket = "the0x"
    key    = "tools/ragnar/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}