module "network" {
  source = "./modules/network"

  vpc_cidr           = "10.0.0.0/16"
  vpc_name           = "my-custom-vpc"
  instance_tenancy   = "default"
  enable_dns_support = true

  subnet_cidrs       = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  availability_zones = ["us-west-2a", "us-west-2b", "us-west-2c"]
  subnet_name_prefix = "custom-subnet-"

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
      cidr_block = "203.0.113.0/24"  
      from_port  = 80
      to_port    = 80
    },
    {
      protocol   = "tcp"
      rule_no    = 110
      action     = "allow"
      cidr_block = "203.0.113.0/24"  
      from_port  = 443
      to_port    = 443
    },
    {
      protocol   = "tcp"
      rule_no    = 120
      action     = "allow"
      cidr_block = "203.0.113.0/24"
      from_port  = 22
      to_port    = 22
    }
  ]

  nacl_name = "custom-network-acl"

  igw_name = "custom-internet-gateway"

  route_table_routes = [
    {
      cidr_block = "0.0.0.0/0"
      gateway_id = "igw"  # This will be replaced with the actual IGW ID in the module
    },
    {
      cidr_block = "172.31.0.0/16"
      gateway_id = "local"  # Example of a local route
    }
  ]

  route_table_name = "custom-route-table"

  common_tags = {
    Environment = "Production"
    Project     = "MyApp"
    ManagedBy   = "Terraform"
  }
}

output "vpc_id" {
  value = module.network.vpc_id
}

output "subnet_ids" {
  value = module.network.subnet_ids
}

output "internet_gateway_id" {
  value = module.network.internet_gateway_id
}

output "route_table_id" {
  value = module.network.route_table_id
}

output "network_acl_id" {
  value = module.network.network_acl_id
}
