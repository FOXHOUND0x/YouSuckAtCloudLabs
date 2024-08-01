resource "aws_dynamodb_table" "example" {
  name         = "example-table"
  billing_mode = "PAY_PER_REQUEST"

  server_side_encryption {
    enabled = false  # Encryption is disabled
  }
}
