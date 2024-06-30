packer {
    required_plugins {
        amazon = {
            version = ">= 0.0.2"
            source  = "github.com/hashicorp/amazon"
        }
    }
}

data "amazon-ami" "consul-amzn2" {
    most_recent = true
    owners = ["amazon"]
    region = "us-east-1"

    filters = {
        image-id = "ami-00beae93a2d981137"
    }
}

source "amazon-ebs" "consul-amzn2" {
    ami_name = "consul-amzn2-{{timestamp}}"
    instance_type = "t2.micro"
    region = "us-east-1"
    source_ami = data.amazon-ami.consul-amzn2.id
    ssh_username = "ec2-user"
}

build {
    name = "consul-amzn2"
    sources = [
        "source.amazon-ebs.consul-amzn2"
    ]

    provisioner "shell" {
        script = "scripts/install-consul.sh"
    }

    provisioner "file" {
        source      = "scripts/consul.hcl"
        destination = "/tmp/consul.hcl"
    }

    provisioner "file" {
        source = "scripts/consul.service"
        destination = "/tmp/consul.service"
    }

    provisioner "shell" {
        inline = [
            "sudo cp /tmp/consul.hcl /etc/consul.d/consul.hcl",
            "sudo chown consul:consul /etc/consul.d/consul.hcl",
            "sudo chmod 640 /etc/consul.d/consul.hcl",
            "sudo cp /tmp/consul.service /etc/systemd/system/consul.service",
            "sudo chown consul:consul /etc/systemd/system/consul.service",
            "sudo chmod 644 /etc/systemd/system/consul.service",
        ]
    }

    provisioner "shell" {
        inline = [
            "sudo systemctl daemon-reload",
            "sudo systemctl enable consul",
        ]
    }
}