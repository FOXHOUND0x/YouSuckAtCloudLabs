resource "aws_s3_bucket" "secured" {
  bucket = "secured-bucket"

  versioning {
    enabled = true  # Versioning is enabled
  }
}
