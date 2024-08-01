resource "aws_db_instance" "example" {
  identifier              = "example-db-instance"
  engine                 = "mysql"
  instance_class         = "db.t2.micro"
  allocated_storage       = 20
  storage_type           = "gp2"
  
  auto_minor_version_upgrade = false  # Auto minor version upgrade is disabled
}
