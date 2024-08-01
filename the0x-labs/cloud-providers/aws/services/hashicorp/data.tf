data "http" "my_ip" {
    url = "http://checkip.amazonaws.com/"
}

data "aws_vpc" "default" {
    default = true
}

locals {
    my_ip = chomp(data.http.my_ip.response_body)
    my_ip_cidr = "${local.my_ip}/32"
}