resource "aws_s3_bucket" "example" {
  bucket = "example-bucket"
  acl    = "public-read-write"  # Public read-write access is allowed
}
