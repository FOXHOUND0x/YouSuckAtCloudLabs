resource "aws_cloudtrail" "example" {
  name                          = "example-trail"
  s3_bucket_name               = "my-cloudtrail-logs"
  include_global_service_events = true
  # KMS key ID is not set, indicating logs are not encrypted
}
