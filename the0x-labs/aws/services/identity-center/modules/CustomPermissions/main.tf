data "aws_ssoadmin_permission_set" "current" {
  instance_arn = data.aws_ssoadmin_instances.current.arns[0]
  name         = var.permission_set_name
}

resource "aws_ssoadmin_account_assignment" "account_assignment" {
  for_each = contains(var.account_names, "ALL") ? local.all_accounts_map : local.selected_accounts_map
  
  depends_on         = [data.aws_ssoadmin_permission_set.current]
  instance_arn       = tolist(data.aws_ssoadmin_instances.current.arns)[0]
  permission_set_arn = data.aws_ssoadmin_permission_set.current.arn
  principal_id       = var.group_id
  principal_type     = "GROUP"
  target_id          = each.value
  target_type        = "AWS_ACCOUNT"
}