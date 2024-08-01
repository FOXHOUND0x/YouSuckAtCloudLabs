variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name tag for the VPC"
  type        = string
}

variable "instance_tenancy" {
  description = "Instance tenancy for the VPC"
  type        = string
  default     = "default"
}

variable "enable_dns_support" {
  description = "Enable DNS support for the VPC"
  type        = bool
  default     = true
}

variable "subnet_cidrs" {
  description = "List of CIDR blocks for subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones for subnets"
  type        = list(string)
}

variable "subnet_name_prefix" {
  description = "Prefix for subnet names"
  type        = string
  default     = "hive_subnet"
}

variable "nacl_egress_rules" {
  description = "List of egress rules for Network ACL"
  type = list(object({
    protocol   = string
    rule_no    = number
    action     = string
    cidr_block = string
    from_port  = number
    to_port    = number
  }))
}

variable "nacl_ingress_rules" {
  description = "List of ingress rules for Network ACL"
  type = list(object({
    protocol   = string
    rule_no    = number
    action     = string
    cidr_block = string
    from_port  = number
    to_port    = number
  }))
}

variable "nacl_name" {
  description = "Name for the Network ACL"
  type        = string
  default     = "hive_egress_nacl"
}

variable "igw_name" {
  description = "Name for the Internet Gateway"
  type        = string
  default     = "hive_igw"
}

variable "route_table_routes" {
  description = "List of routes for the route table"
  type = list(object({
    cidr_block = string
    gateway_id = string
  }))
}

variable "route_table_name" {
  description = "Name for the route table"
  type        = string
  default     = "hive_route_table"
}

variable "common_tags" {
  description = "Common tags to be applied to all resources"
  type        = map(string)
  default     = {}
}
