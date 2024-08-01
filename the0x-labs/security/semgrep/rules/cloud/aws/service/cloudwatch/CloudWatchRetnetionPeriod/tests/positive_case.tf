resource "aws_cloudwatch_log_group" "example" {
  name = "example-log-group"
  retention_in_days = 0  # Retention period is not set, should trigger a warning
}
