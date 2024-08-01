resource "aws_iam_role" "secured" {
  name = "secured-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy" "secured_policy" {
  name = "secured-policy"
  role = aws_iam_role.secured.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = ["s3:ListBucket", "s3:GetObject"]  # Least privilege example
        Resource = "*"
      }
    ]
  })
}
