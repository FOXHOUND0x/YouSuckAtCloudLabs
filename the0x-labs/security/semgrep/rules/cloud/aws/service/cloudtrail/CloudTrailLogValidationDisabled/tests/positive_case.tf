resource "aws_cloudtrail" "example" {
  name                          = "example-trail"
  s3_bucket_name               = "my-cloudtrail-logs"
  include_global_service_events = true
  enable_log_file_validation    = false  # Log file validation is disabled
}
