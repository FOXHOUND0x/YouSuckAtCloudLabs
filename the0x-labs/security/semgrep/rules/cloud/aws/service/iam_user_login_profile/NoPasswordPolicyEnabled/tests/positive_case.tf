resource "aws_iam_user_login_profile" "example" {
  user     = "example-user"
  password = "examplePassword123"  # Password is set, but no password policy defined
}
