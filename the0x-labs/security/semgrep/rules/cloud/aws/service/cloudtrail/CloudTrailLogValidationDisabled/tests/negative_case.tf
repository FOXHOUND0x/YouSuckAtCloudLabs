resource "aws_cloudtrail" "secured" {
  name                          = "secured-trail"
  s3_bucket_name               = "my-secured-cloudtrail-logs"
  include_global_service_events = true
  enable_log_file_validation    = true  # Log file validation is enabled
}
