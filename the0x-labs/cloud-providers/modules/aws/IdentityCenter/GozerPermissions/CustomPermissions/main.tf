resource "aws_ssoadmin_permission_set" "permission_set" {
    for_each = contains(var.account_names, "ALL") ? local.final_all_stripped_accounts_map : local.final_selected_stripped_accounts_map
    name = "${each.key}-${var.permission_set_name}"
    instance_arn = tolist(data.aws_ssoadmin_instances.current.arns)[0]
}

resource "aws_ssoadmin_permission_set_inline_policy" "permission_set_inline_policy" {
    for_each = contains(var.account_names, "ALL") ? local.final_all_stripped_accounts_map : local.final_selected_stripped_accounts_map
    instance_arn = tolist(data.aws_ssoadmin_instances.current.arns)[0]
    permission_set_arn = aws_ssoadmin_permission_set.permission_set[each.key].arn
    inline_policy = file("../../../modules/aws/IdentityCenter/CustomPermissions/policy-library/gz-elevated/policy.json")
}


resource "aws_ssoadmin_account_assignment" "account_assignment" {
  for_each = contains(var.account_names, "ALL") ? local.final_all_stripped_accounts_map : local.final_selected_stripped_accounts_map
  depends_on         = [aws_ssoadmin_permission_set.permission_set]
  instance_arn       = tolist(data.aws_ssoadmin_instances.current.arns)[0]
  permission_set_arn = aws_ssoadmin_permission_set.permission_set[each.key].arn
  principal_id       = var.group_id
  principal_type     = "GROUP"
  target_id          = each.value
  target_type        = "AWS_ACCOUNT"
}