resource "aws_s3_bucket" "example" {
  bucket = "example-bucket"

  # Access logging is not configured
  logging {
    target_bucket = null  # Access logging is not enabled
  }
}
