resource "aws_launch_configuration" "secured" {
  name          = "secured-launch-configuration"
  image_id      = "ami-87654321"
  instance_type = "t2.micro"
  
  security_groups = [aws_security_group.secured_sg.id]  # Security group attached
}

resource "aws_security_group" "secured_sg" {
  name        = "secured-sg"
  description = "Security group with restricted access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["192.168.1.0/24"]  # Only allowing access from a specific CIDR block
  }
}
