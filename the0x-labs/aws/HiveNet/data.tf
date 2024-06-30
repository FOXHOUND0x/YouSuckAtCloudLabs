data "aws_vpc" "hive_net" {
    depends_on = [aws_vpc.hive_net]
    filter {
        name = "tag:Name"
        values = ["hive_net"]
    }
}


data "http" "local" {
    url = "http://ipv4.icanhazip.com"
}