resource "aws_dynamodb_table" "secured" {
  name         = "secured-table"
  billing_mode = "PAY_PER_REQUEST"

  server_side_encryption {
    enabled = true  # Encryption is enabled
  }
}
