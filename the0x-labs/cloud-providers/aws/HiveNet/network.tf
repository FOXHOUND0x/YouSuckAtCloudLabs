resource "aws_vpc" "hive_net" {
    cidr_block = "10.0.0.0/24"
    instance_tenancy = "default"
    enable_dns_support = true
    tags = {
        Name = "hive_net"
    }
}

resource "aws_subnet" "hive_subnet" {
    vpc_id = "${aws_vpc.hive_net.id}"
    cidr_block = "10.0.0.0/26"
    availability_zone = "us-east-1a"
    tags = {
        Name = "hive_subnet"
    }
}

resource "aws_subnet" "hive_subnet2" {
    vpc_id = "${aws_vpc.hive_net.id}"
    cidr_block = "10.0.0.64/26"
    availability_zone = "us-east-1b"
    tags = {
        Name = "hive_subnet2"
    }
}

resource "aws_subnet" "hive_subnet3" {
    vpc_id = "${aws_vpc.hive_net.id}"
    cidr_block = "10.0.0.128/26"
    availability_zone = "us-east-1c"
    tags = {
        Name = "hive_subnet3"
    }
}

resource "aws_network_acl" "hive_egress_nacl" {
    vpc_id = data.aws_vpc.hive_net.id
    egress {
        protocol = "-1"
        rule_no = 100
        action = "allow"
        cidr_block = "0.0.0.0/0"
        from_port = 0
        to_port = 0
    }

    ingress {
        protocol = "tcp"
        rule_no = 100
        action = "allow"
        cidr_block = local.my_ip_cidr
        from_port = 80
        to_port = 80
    }
    
    ingress {
        protocol = "tcp"
        rule_no = 101
        action = "allow"
        cidr_block = local.my_ip_cidr
        from_port = 443
        to_port = 443
    }
    
    tags = {
        Name = "hive_egress_nacl"
    }
}

resource "aws_internet_gateway" "hive_igw" {
    vpc_id = data.aws_vpc.hive_net.id
    tags = {
        Name = "hive_igw"
    }
}

resource "aws_route_table" "hive_route_table" {
    vpc_id = data.aws_vpc.hive_net.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.hive_igw.id
    }
    tags = {
        Name = "hive_route_table"
    }
}

resource "aws_route_table_association" "hive_route_table_association" {
    subnet_id = aws_subnet.hive_subnet.id
    route_table_id = aws_route_table.hive_route_table.id
}
