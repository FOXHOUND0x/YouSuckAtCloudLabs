resource "aws_s3_bucket_object" "example" {
  bucket = "example-bucket"
  key    = "example-object"
  source = "path/to/source/file"

  server_side_encryption = null  # No encryption specified
}
