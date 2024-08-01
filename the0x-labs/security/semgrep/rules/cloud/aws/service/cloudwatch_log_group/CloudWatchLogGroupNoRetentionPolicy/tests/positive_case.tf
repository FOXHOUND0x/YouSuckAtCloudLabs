resource "aws_cloudwatch_log_group" "example" {
  name = "example-log-group"
  # No retention policy set
  retention_in_days = null
}
