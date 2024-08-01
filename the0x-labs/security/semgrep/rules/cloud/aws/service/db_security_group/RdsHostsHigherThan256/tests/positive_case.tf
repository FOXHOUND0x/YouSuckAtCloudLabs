resource "aws_db_security_group" "example" {
  name = "example-db-sg"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr        = "0.0.0.0/0"  # Public access allowed, should trigger warning
  }
}
