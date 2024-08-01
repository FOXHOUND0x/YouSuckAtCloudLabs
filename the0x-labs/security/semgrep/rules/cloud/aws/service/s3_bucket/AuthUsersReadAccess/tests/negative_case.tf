resource "aws_s3_bucket" "secured" {
  bucket = "secured-bucket"
  acl    = "private"  # No public or authenticated access, should not trigger a warning
}
