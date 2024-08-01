resource "aws_security_group" "the0x_demo" {
    name = "hashicorp-suite"
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