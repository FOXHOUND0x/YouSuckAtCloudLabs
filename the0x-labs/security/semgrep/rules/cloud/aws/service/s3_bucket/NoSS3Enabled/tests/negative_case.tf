resource "aws_s3_bucket" "secured" {
  bucket = "secured-bucket"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "aws:kms"  # KMS encryption enabled
        kms_master_key_id = "arn:aws:kms:us-east-1:123456789012:key/my-kms-key-id"  # KMS key specified
      }
    }
  }
}
