resource "aws_ebs_encryption_by_default" "secured" {
  enabled = true  # Default encryption is enabled
}
