resource "aws_launch_configuration" "example" {
  name          = "example-launch-configuration"
  image_id      = "ami-12345678"
  instance_type = "t2.micro"
  
  iam_instance_profile = aws_iam_role.admin_role.name  # Overly permissive IAM role
}

resource "aws_iam_role" "admin_role" {
  name = "admin-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "iam:*"  # Overly permissive IAM role
        Resource = "*"
      }
    ]
  })
}
