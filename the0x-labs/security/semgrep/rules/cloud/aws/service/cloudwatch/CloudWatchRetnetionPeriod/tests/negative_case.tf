resource "aws_cloudwatch_log_group" "secured" {
  name = "secured-log-group"
  retention_in_days = 30  # Retention period is set, should not trigger a warning
}
