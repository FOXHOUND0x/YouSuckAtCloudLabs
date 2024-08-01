resource "aws_s3_bucket" "secured" {
  bucket = "secured-bucket"
  acl    = "private"  # No public access, should not trigger a warning
}
