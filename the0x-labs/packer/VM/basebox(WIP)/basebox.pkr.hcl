// this is going to be a basebox that will feed into other AMIs.
// to start this basebox is going to install tailscale so that any other AMI that is built from this basebox will have tailscale installed.

packer {
    required_plugins {
        amazon = {
            version = ">= 0.0.2"
            source  = "github.com/hashicorp/amazon"
        }
    }
}

data "amazon-ami" "basebox-amzn2" {
    most_recent = true
    owners = ["amazon"]
    region = "us-east-1"

    filters = {
        image-id = "ami-00beae93a2d981137"
    }
}

source "amazon-ebs" "basebox-amzn2" {
    ami_name = "basebox-amzn2-{{timestamp}}"
    instance_type = "t2.micro"
    region = "us-east-1"
    source_ami = data.amazon-ami.vault-amzn2.id
    ssh_username = "ec2-user"
}

build {
    name = "basebox-amzn2"
    sources = [
        "source.amazon-ebs.basebox-amzn2"
    ]

    provisioner "shell" {
        script = "scripts/install-tailscale.sh"
    }
}