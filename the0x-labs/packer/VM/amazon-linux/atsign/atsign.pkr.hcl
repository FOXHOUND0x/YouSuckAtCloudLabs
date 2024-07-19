packer {
    required_plugins {
        amazon = {
            version = ">= 0.0.2"
            source  = "github.com/hashicorp/amazon"
        }
    }
}

data "amazon-ami" "atsign-amzn2" {
    most_recent = true
    owners = ["amazon"]
    region = "us-east-1"

    filters = {
        image-id = "ami-00beae93a2d981137"
    }
}

source "amazon-ebs" "atsign-amzn2" {
    ami_name = "atsign-amzn2-{{timestamp}}"
    instance_type = "t2.micro"
    region = "us-east-1"
    source_ami = data.amazon-ami.atsign-amzn2.id
    ssh_username = "ec2-user"
}

build {
    name = "atsign-amzn2"
    sources = [
        "source.amazon-ebs.atsign-amzn2"
    ]

    provisioner "shell" {
        script = "scripts/install-atsign.sh"
    }
}