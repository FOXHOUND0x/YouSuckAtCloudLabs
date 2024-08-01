resource "aws_dynamodb_table" "example" {
  name         = "example-table"
  billing_mode = "PAY_PER_REQUEST"
  point_in_time_recovery {
    enabled = false
  }
}
