resource "aws_key_pair" "generated_key" {
    key_name   = "the0x-key"
    public_key = file("~/.ssh/the0x.pub")
}

resource "aws_instance" "the0x_demo" {
    ami = "ami-01dba91ac4ca26259"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.the0x_demo.name]
    tags = {
        Name = "atsign-demo"
    }
    key_name = aws_key_pair.generated_key.key_name
    metadata_options {
        http_tokens = "required"
    }
}

locals {
    my_ip = chomp(data.http.my_ip.response_body)
    my_ip_cidr = "${local.my_ip}/32"
}

data "aws_vpc" "default" {
    default = true
}

data "http" "my_ip" {
    url = "http://checkip.amazonaws.com/"
}

resource "aws_security_group" "the0x_demo" {
    name = "atsign-demo"
    vpc_id = data.aws_vpc.default.id
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [local.my_ip_cidr]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}