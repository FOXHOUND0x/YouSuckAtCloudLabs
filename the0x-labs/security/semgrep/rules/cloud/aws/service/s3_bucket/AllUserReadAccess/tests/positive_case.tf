resource "aws_s3_bucket" "example" {
  bucket = "example-bucket"
  acl    = "public-read"  # Public read access is allowed
}
