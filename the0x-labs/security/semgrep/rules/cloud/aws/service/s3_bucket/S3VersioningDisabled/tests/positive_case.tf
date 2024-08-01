resource "aws_s3_bucket" "example" {
  bucket = "example-bucket"

  versioning {
    enabled = false  # Versioning is disabled
  }
}
