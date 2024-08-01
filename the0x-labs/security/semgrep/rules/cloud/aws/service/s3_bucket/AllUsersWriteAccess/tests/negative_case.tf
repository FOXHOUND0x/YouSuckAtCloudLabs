resource "aws_s3_bucket" "secured" {
  bucket = "secured-bucket"
  acl    = "private"  # No public or write access, should not trigger a warning
}
