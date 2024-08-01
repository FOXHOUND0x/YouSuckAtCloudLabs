resource "aws_cloudwatch_log_group" "secured" {
  name = "secured-log-group"
  retention_in_days = 14  # Retention policy set
}
