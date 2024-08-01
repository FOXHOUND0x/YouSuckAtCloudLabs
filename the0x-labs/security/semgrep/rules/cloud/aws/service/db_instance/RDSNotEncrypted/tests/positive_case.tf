resource "aws_db_instance" "example" {
  identifier              = "example-db-instance"
  engine                 = "mysql"
  instance_class         = "db.t2.micro"
  allocated_storage       = 20
  storage_type           = "gp2"
  
  storage_encrypted = false  # Storage encryption is disabled
}
