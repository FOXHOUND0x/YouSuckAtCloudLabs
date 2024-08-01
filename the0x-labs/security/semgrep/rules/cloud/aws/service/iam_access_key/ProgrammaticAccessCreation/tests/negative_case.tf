resource "aws_iam_user" "secured" {
  name = "secured-user"
}

resource "aws_iam_access_key" "secured_access_key" {
  user = aws_iam_user.secured.name  # Access key associated with a non-root user
}
