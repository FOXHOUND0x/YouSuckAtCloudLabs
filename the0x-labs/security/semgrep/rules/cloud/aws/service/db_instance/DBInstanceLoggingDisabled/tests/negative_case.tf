resource "aws_db_instance" "secured" {
  identifier              = "secured-db-instance"
  engine                 = "mysql"
  instance_class         = "db.t2.micro"
  allocated_storage       = 20
  storage_type           = "gp2"
  
  enabled_cloudwatch_logs_exports = ["error", "general"]  # Logging is enabled
}
