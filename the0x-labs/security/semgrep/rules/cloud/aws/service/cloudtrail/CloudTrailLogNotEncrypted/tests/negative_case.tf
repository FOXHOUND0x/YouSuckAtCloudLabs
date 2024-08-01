resource "aws_cloudtrail" "example" {
  name                          = "example-trail"
  s3_bucket_name               = "my-cloudtrail-logs"
  include_global_service_events = true
  kms_key_id                   = "my-kms-key"  # Key ID set here.
}
