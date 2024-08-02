resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/24"
  
  tags = {
    Name = "example-vpc"
  }
}

resource "aws_security_group" "example" {
  name        = "example-sg"
  description = "Example security group"
  vpc_id      = aws_vpc.example.id
}

locals {
  first_ip = cidrhost(aws_vpc.example.cidr_block, 4)
  subnet_cidrs = cidrsubnets(aws_vpc.example.cidr_block, 4, 4, 4)
}

output "first_usable_ip" {
  value = local.first_ip
}

output "subnet_cidrs" {
  value = local.subnet_cidrs
}

resource "aws_subnet" "example" {
  count             = length(local.subnet_cidrs)
  vpc_id            = aws_vpc.example.id
  cidr_block        = local.subnet_cidrs[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "example-subnet-${count.index}"
  }
}

# # Use the ipv4_address_count function to get the number of available IPs in a subnet
# output "available_ips_per_subnet" {
#   value = aws_provider::aws::ipv4_address_count(local.subnet_cidrs[0])
# }

# # Use the vpc_security_group_rule_description_validator function to validate security group rule descriptions
# resource "aws_security_group_rule" "example" {
#   type              = "ingress"
#   from_port         = 80
#   to_port           = 80
#   protocol          = "tcp"
#   cidr_blocks       = ["0.0.0.0/0"]
#   security_group_id = aws_security_group.example.id
#   description       = aws_provider::aws::vpc_security_group_rule_description_validator("Allow HTTP from anywhere")
# }

# # Use the data source to get available AZs
data "aws_availability_zones" "available" {
  state = "available"
}

# # Output the VPC ID and subnet IDs
# output "vpc_id" {
#   value = aws_vpc.example.id
# }

# output "subnet_ids" {
#   value = aws_subnet.example[*].id
# }

# output "first_usable_ip" {
#   value = local.first_ip
# }
