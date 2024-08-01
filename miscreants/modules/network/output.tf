output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.hive_net.id
}

output "subnet_ids" {
  description = "The IDs of the subnets"
  value       = aws_subnet.hive_subnets[*].id
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.hive_igw.id
}

output "route_table_id" {
  description = "The ID of the route table"
  value       = aws_route_table.hive_route_table.id
}

output "network_acl_id" {
  description = "The ID of the Network ACL"
  value       = aws_network_acl.hive_egress_nacl.id
}
