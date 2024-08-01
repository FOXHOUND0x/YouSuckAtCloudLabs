resource "aws_db_security_group" "secured" {
  name = "secured-db-sg"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr        = "192.168.1.0/24"  # Restricted access, should not trigger warning
  }
}
