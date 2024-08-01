resource "aws_s3_bucket" "secured" {
  bucket = "secured-bucket"

  logging {
    target_bucket = "my-logs-bucket"  # Access logging is enabled
    target_prefix = "log/"  
  }
}
