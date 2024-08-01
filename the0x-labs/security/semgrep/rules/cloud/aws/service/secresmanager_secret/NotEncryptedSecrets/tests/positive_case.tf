resource "aws_secretsmanager_secret" "example" {
  name = "example-secret"
  
  # No KMS key specified, indicating the secret is not encrypted
  kms_key_id = null  
}
