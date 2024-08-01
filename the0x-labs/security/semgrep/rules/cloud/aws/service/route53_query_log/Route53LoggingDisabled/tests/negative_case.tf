resource "aws_route53_query_log" "secured" {
  zone_id = aws_route53_zone.secured.zone_id
  
  # CloudWatch logging is enabled
  cloudwatch_log_group_arn = "arn:aws:logs:us-east-1:123456789012:log-group:my-log-group"  
}
