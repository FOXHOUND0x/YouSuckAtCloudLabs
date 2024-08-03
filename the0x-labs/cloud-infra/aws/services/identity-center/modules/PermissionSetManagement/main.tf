resource "aws_ssoadmin_permission_set" "custom_permission_set" {
    count = length(var.base_locked_roles)
    name = var.base_locked_roles[count.index]
    instance_arn = tolist(data.aws_ssoadmin_instances.current.arns)[0]
}

resource "aws_iam_policy" "custom_managed_policy" {
    count = length(var.base_locked_roles)
    name = var.base_locked_roles[count.index]
    description = "Managed policy for ${var.base_locked_roles[count.index]}"
    policy = file("../../../modules/aws/IdentityCenter/CustomPermissions/policy-library/${var.base_locked_roles[count.index]}/policy.json")
}

resource "aws_ssoadmin_permission_set_inline_policy" "custom_permission_set_policy" {
    count = length(var.base_locked_roles)
    permission_set_arn = aws_ssoadmin_permission_set.custom_permission_set[count.index].arn
    inline_policy      = aws_iam_policy.custom_managed_policy[count.index].policy
    instance_arn       = tolist(data.aws_ssoadmin_instances.current.arns)[0]
}