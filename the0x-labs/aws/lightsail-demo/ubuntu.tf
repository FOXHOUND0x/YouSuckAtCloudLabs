resource "aws_lightsail_instance" "demo_instance" {
  name              = "demo-instance"
  availability_zone = "us-east-1a" 
  blueprint_id     = "wordpress"
  bundle_id        = "nano_2_0" 

  tags = {
    Name = "Demo Instance"
  }
}

output "instance_ip" {
  value = aws_lightsail_instance.demo_instance.public_ip_address
}
