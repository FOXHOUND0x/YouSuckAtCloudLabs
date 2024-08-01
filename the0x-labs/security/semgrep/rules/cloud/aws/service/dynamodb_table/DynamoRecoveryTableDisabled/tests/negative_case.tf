resource "aws_dynamodb_table" "secured" {
  name         = "secured-table"
  billing_mode = "PAY_PER_REQUEST"

  point_in_time_recovery {
    enabled = true  # PITR is enabled
  }
}
