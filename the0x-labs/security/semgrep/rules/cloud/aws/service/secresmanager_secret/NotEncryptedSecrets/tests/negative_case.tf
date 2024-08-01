resource "aws_secretsmanager_secret" "secured" {
  name = "secured-secret"
  
  # KMS key specified, indicating the secret is encrypted
  kms_key_id = "arn:aws:kms:us-east-1:123456789012:key/my-kms-key-id"  
}
