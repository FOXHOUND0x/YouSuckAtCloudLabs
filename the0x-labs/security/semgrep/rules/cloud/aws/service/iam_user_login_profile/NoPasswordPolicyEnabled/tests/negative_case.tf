resource "aws_iam_account_password_policy" "policy" {
  minimum_password_length = 12  # Password policy is defined
  require_uppercase_characters = true
  require_lowercase_characters = true
  require_numbers = true
  require_symbols = true
}

resource "aws_iam_user_login_profile" "secured" {
  user     = "secured-user"
  password = "securedPassword123!"  # Password is set, and password policy is defined
}
