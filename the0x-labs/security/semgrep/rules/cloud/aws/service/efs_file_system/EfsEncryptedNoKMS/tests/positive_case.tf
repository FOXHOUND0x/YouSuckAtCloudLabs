resource "aws_efs_file_system" "example" {
  creation_token = "example-efs"
  
  encrypted = true  # EFS encryption is enabled
  kms_key_id = null  # No KMS key specified
}
