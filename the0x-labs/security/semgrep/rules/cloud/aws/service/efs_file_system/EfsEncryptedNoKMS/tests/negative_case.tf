resource "aws_efs_file_system" "secured" {
  creation_token = "secured-efs"
  
  encrypted = true  # EFS encryption is enabled
  kms_key_id = "arn:aws:kms:us-east-1:123456789012:key/my-kms-key-id"  # KMS key specified
}
