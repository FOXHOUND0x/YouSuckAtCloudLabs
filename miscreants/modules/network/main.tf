resource "aws_vpc" "hive_net" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = var.instance_tenancy
  enable_dns_support   = var.enable_dns_support
  tags                 = merge(var.common_tags, { Name = var.vpc_name })
}

resource "aws_subnet" "hive_subnets" {
  count             = length(var.subnet_cidrs)
  vpc_id            = aws_vpc.hive_net.id
  cidr_block        = var.subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]
  tags              = merge(var.common_tags, { Name = "${var.subnet_name_prefix}${count.index + 1}" })
}

resource "aws_network_acl" "hive_egress_nacl" {
  vpc_id = aws_vpc.hive_net.id

  dynamic "egress" {
    for_each = var.nacl_egress_rules
    content {
      protocol   = egress.value["protocol"]
      rule_no    = egress.value["rule_no"]
      action     = egress.value["action"]
      cidr_block = egress.value["cidr_block"]
      from_port  = egress.value["from_port"]
      to_port    = egress.value["to_port"]
    }
  }

  dynamic "ingress" {
    for_each = var.nacl_ingress_rules
    content {
      protocol   = ingress.value["protocol"]
      rule_no    = ingress.value["rule_no"]
      action     = ingress.value["action"]
      cidr_block = ingress.value["cidr_block"]
      from_port  = ingress.value["from_port"]
      to_port    = ingress.value["to_port"]
    }
  }
  
  tags = merge(var.common_tags, { Name = var.nacl_name })
}

resource "aws_internet_gateway" "hive_igw" {
  vpc_id = aws_vpc.hive_net.id
  tags   = merge(var.common_tags, { Name = var.igw_name })
}

resource "aws_route_table" "hive_route_table" {
  vpc_id = aws_vpc.hive_net.id

  dynamic "route" {
    for_each = var.route_table_routes
    content {
      cidr_block = route.value["cidr_block"]
      gateway_id = route.value["gateway_id"] == "igw" ? aws_internet_gateway.hive_igw.id : route.value["gateway_id"]
    }
  }

  tags = merge(var.common_tags, { Name = var.route_table_name })
}

resource "aws_route_table_association" "hive_route_table_association" {
  count          = length(aws_subnet.hive_subnets)
  subnet_id      = aws_subnet.hive_subnets[count.index].id
  route_table_id = aws_route_table.hive_route_table.id
}
