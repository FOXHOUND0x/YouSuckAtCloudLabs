resource "aws_route53_query_log" "example" {
  zone_id = aws_route53_zone.example.zone_id
  
  # CloudWatch logging is not enabled
  cloudwatch_log_group_arn = null  
}
