resource "aws_elasticsearch_domain_policy" "example" {
  domain_name = aws_elasticsearch_domain.example.domain_name
  
  access_policies = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "*"
        Action = "es:*"
        Resource = "*"  # Wildcard policy is attached
      }
    ]
  })
}
