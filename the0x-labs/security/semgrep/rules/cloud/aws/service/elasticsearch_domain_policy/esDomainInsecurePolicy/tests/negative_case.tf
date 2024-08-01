resource "aws_elasticsearch_domain_policy" "secured" {
  domain_name = aws_elasticsearch_domain.secured.domain_name
  
  access_policies = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "arn:aws:iam::123456789012:role/my-role"
        Action = "es:DescribeElasticsearchDomain"
        Resource = aws_elasticsearch_domain.secured.arn  # Specific resource
      }
    ]
  })
}
