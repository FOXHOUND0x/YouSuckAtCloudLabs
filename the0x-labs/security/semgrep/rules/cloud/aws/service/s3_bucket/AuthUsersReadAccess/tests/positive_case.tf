resource "aws_s3_bucket" "example" {
  bucket = "example-bucket"
  acl    = "authenticated-read"  # Authenticated read access is allowed
}
