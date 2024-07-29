# Network Module

This module sets up a fully customizable VPC with multiple subnets, a network ACL, an Internet Gateway, and a route table.

## Usage

```hcl
module "network" {
  source = "./modules/network"

  vpc_cidr           = "10.0.0.0/24"
  vpc_name           = "hive_net"
  subnet_cidrs       = ["10.0.0.0/26", "10.0.0.64/26", "10.0.0.128/26"]
  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
  
  nacl_egress_rules = [
    {
      protocol   = "-1"
      rule_no    = 100
      action     = "allow"
      cidr_block = "0.0.0.0/0"
      from_port  = 0
      to_port    = 0
    }
  ]
  
  nacl_ingress_rules = [
    {
      protocol   = "tcp"
      rule_no    = 100
      action     = "allow"
      cidr_block = "YOUR_IP_ADDRESS/32"
      from_port  = 80
      to_port    = 80
    },
    {
      protocol   = "tcp"
      rule_no    = 101
      action     = "allow"
      cidr_block = "YOUR_IP_ADDRESS/32"
      from_port  = 443
      to_port    = 443
    }
  ]
  
  route_table_routes = [
    {
      cidr_block = "0.0.0.0/0"
      gateway_id = "igw"
    }
  ]
  
  common_tags = {
    Environment = "Production"
    Project     = "Hive"
  }
}
