data "aws_vpc" "hive_net" {
    depends_on = [aws_vpc.hive_net]
    filter {
        name = "tag:Name"
        values = ["hive_net"]
    }
}

data "http" "my_ip" {
    url = "http://checkip.amazonaws.com/"
}

locals {
    my_ip = chomp(data.http.my_ip.response_body)
    my_ip_cidr = "${local.my_ip}/32"
}