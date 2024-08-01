packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

variable "aws_region" {
  type    = string
  default = "us-west-2"
}

variable "github_owner" {
  type    = string
}

variable "github_repo" {
  type    = string
}

variable "github_token" {
  type    = string
  sensitive = true
}

source "amazon-ebs" "amazon_linux" {
  ami_name           = "github-runner-ami-{{timestamp}}"
  instance_type      = "t2.micro"
  region             = var.aws_region
  source_ami_filter {
    filters = {
      virtualization-type = "hvm"
      name                = "amzn2-ami-hvm-*-x86_64-gp2"
      root-device-type    = "ebs"
    }
    owners      = ["137112412989"]
    most_recent = true
  }
  ssh_username       = "ec2-user"
}

build {
  sources = ["source.amazon-ebs.amazon_linux"]

  provisioner "shell" {
    script = "install-github-runner.sh"
    environment_vars = [
      "GITHUB_OWNER={{user `github_owner`}}",
      "GITHUB_REPO={{user `github_repo`}}",
      "GITHUB_TOKEN={{user `github_token`}}"
    ]
  }
}