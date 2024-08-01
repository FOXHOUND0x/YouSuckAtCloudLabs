resource "aws_launch_configuration" "example" {
  name          = "example-launch-configuration"
  image_id      = "ami-12345678"
  instance_type = "t2.micro"
  
  security_groups = [aws_security_group.open_sg.id]  # Security group attached
}

resource "aws_security_group" "open_sg" {
  name        = "open-sg"
  description = "Security group wide open to the internet"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "-1"  # All protocols
    cidr_blocks = ["0.0.0.0/0"]  # Wide open to the internet
  }
}
