data "aws_iam_users" "users" {}

data "aws_iam_access_keys" "access_keys" {
  for_each = data.aws_iam_users.users.names
  user = each.value
}


