resource "aws_s3_bucket_object" "secured" {
  bucket = "secured-bucket"
  key    = "secured-object"
  source = "path/to/source/file"

  server_side_encryption = "AES256"  # Encryption is enabled
}
