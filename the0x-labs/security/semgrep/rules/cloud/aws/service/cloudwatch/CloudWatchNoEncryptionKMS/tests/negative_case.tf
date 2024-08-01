resource "aws_cloudwatch_log_group" "secured" {
  name = "secured-log-group"
  # KMS key is specified, indicating the log group is encrypted
  kms_key_id = "arn:aws:kms:us-east-1:123456789012:key/my-kms-key-id"
}
