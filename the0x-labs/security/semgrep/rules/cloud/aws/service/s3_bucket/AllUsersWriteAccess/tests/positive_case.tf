resource "aws_s3_bucket" "example" {
  bucket = "example-bucket"
  acl    = "public-read-write"  # Public write access is allowed
}
