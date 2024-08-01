resource "aws_s3_bucket" "secured" {
  bucket = "secured-bucket"

  # No website configuration, should not trigger a warning
}
