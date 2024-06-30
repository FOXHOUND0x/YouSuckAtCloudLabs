packer {
    required_plugins {
        amazon = {
            version = ">= 0.0.2"
            source  = "github.com/hashicorp/amazon"
        }
    }
}

data "amazon-ami" "vault-amzn2" {
    most_recent = true
    owners = ["amazon"]
    region = "us-east-1"

    filters = {
        image-id = "ami-00beae93a2d981137"
    }
}

source "amazon-ebs" "vault-amzn2" {
    ami_name = "vault-amzn2-{{timestamp}}"
    instance_type = "t2.micro"
    region = "us-east-1"
    source_ami = data.amazon-ami.vault-amzn2.id
    ssh_username = "ec2-user"
}

build {
    name = "vault-amzn2"
    sources = [
        "source.amazon-ebs.vault-amzn2"
    ]

    provisioner "shell" {
        script = "scripts/install-vault.sh"
    }

    provisioner "file" {
        source      = "scripts/vault.hcl"
        destination = "/tmp/vault.hcl"
    }

    provisioner "file" {
        source = "scripts/vault.service"
        destination = "/tmp/vault.service"
    }

    provisioner "shell" {
        inline = [
            "sudo cp /tmp/vault.hcl /etc/vault.d/vault.hcl",
            "sudo chown vault:vault /etc/vault.d/vault.hcl",
            "sudo chmod 640 /etc/vault.d/vault.hcl",
            "sudo cp /tmp/vault.service /etc/systemd/system/vault.service",
            "sudo chown vault:vault /etc/systemd/system/vault.service",
            "sudo chmod 644 /etc/systemd/system/vault.service",
        ]
    }

    provisioner "shell" {
        inline = [
            "sudo systemctl daemon-reload",
            "sudo systemctl enable vault",
        ]
    }
}