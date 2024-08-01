resource "aws_ebs_volume" "secured" {
  availability_zone = "us-east-1a"
  size              = 20
  encrypted         = true  # EBS volume is encrypted
  kms_key_id       = "arn:aws:kms:us-east-1:123456789012:key/my-kms-key-id"  # KMS key specified
}
