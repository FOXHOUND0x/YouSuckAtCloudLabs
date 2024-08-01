resource "aws_db_instance" "example" {
  identifier              = "example-db-instance"
  engine                 = "mysql"
  instance_class         = "db.t2.micro"
  allocated_storage       = 20
  storage_type           = "gp2"
  
  iam_database_authentication_enabled = false  # IAM authentication is disabled
}
