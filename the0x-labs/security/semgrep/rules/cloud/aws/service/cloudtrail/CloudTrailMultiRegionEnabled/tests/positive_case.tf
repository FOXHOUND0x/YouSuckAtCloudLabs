resource "aws_cloudtrail" "example" {
  name                          = "example-trail"
  s3_bucket_name               = "my-cloudtrail-logs"
  include_global_service_events = true
  is_multi_region_trail        = false  
}
