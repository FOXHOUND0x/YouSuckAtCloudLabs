resource "aws_ssoadmin_permission_set" "managed_permission_set" {
    name = var.permission_set_name
    instance_arn = tolist(data.aws_ssoadmin_instances.current.arns)[0]
}

resource "aws_ssoadmin_managed_policy_attachment" "managed_permission_set" {
    instance_arn = tolist(data.aws_ssoadmin_instances.current.arns)[0]
    managed_policy_arn = var.managed_policy_arn
    permission_set_arn = aws_ssoadmin_permission_set.managed_permission_set.arn
}

resource "aws_ssoadmin_account_assignment" "account_assignment" {
  for_each = contains(var.account_names, "ALL") ? local.all_accounts_map : local.selected_accounts_map
  
  depends_on         = [aws_ssoadmin_managed_policy_attachment.managed_permission_set]
  instance_arn       = tolist(data.aws_ssoadmin_instances.current.arns)[0]
  permission_set_arn = aws_ssoadmin_permission_set.managed_permission_set.arn
  principal_id       = var.group_id
  principal_type     = "GROUP"
  target_id          = each.value
  target_type        = "AWS_ACCOUNT"
}