packer {
    required_plugins {
        amazon = {
            version = ">= 0.0.2"
            source  = "github.com/hashicorp/amazon"
        }
    }
}

data "amazon-ami" "amazon-linux-2" {
    most_recent = true
    owners = ["amazon"]
    region = "us-east-1"

    filters = {
        name   = "amzn2-ami-hvm-*-x86_64-gp2"
        root-device-type = "ebs"
    }
}

source "amazon-ebs" "ollama" {
    ami_name      = "ollama-{{timestamp}}"
    instance_type = "t2.micro"
    region        = "us-east-1"
    source_ami    = data.amazon-ami.amazon-linux-2.id
    ssh_username  = "ec2-user"
}

build {
    name = "ollama"
    sources = [
        "source.amazon-ebs.ollama"
    ]

    provisioner "shell" {
        script = "scripts/install-ollama.sh"
    }
}