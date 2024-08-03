resource "aws_ssoadmin_permission_set" "custom_permission_set" {
    name = var.base_role_name 
    instance_arn = tolist(data.aws_ssoadmin_instances.current.arns)[0]
}

resource "aws_ssoadmin_managed_policy_attachment" "managed_permission_set" {
    count = length(var.managed_policy_arns)
    permission_set_arn = aws_ssoadmin_permission_set.custom_permission_set.arn
    managed_policy_arn = "arn:aws:iam::aws:policy/${var.managed_policy_arns[count.index]}"
    instance_arn = tolist(data.aws_ssoadmin_instances.current.arns)[0]
}

resource "aws_iam_policy" "custom_managed_policy" {
    name = var.base_role_name
    description = "Managed policy for ${var.base_role_name}"
    policy = file("../../../modules/aws/IdentityCenter/CustomPermissions/policy-library/${var.base_locked_policy}/policy.json")
}

resource "aws_ssoadmin_permission_set_inline_policy" "custom_permission_set_policy" {
    permission_set_arn = aws_ssoadmin_permission_set.custom_permission_set.arn
    inline_policy      = aws_iam_policy.custom_managed_policy.policy
    instance_arn       = tolist(data.aws_ssoadmin_instances.current.arns)[0]
}
