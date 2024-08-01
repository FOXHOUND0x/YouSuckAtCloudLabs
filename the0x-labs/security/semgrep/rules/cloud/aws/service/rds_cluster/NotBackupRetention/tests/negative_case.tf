resource "aws_athena_database" "secure" {
  name = "secure_database"

  encryption_configuration {
    encryption_option = "SSE_KMS"  # Properly configured encryption
  }
}
