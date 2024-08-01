resource "aws_cloudwatch_log_group" "example" {
  name = "example-log-group"
  # KMS key is not specified, indicating the log group is not encrypted
  kms_key_id = null
}
