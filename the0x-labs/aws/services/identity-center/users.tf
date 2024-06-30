resource "aws_identitystore_user" "the0x" {
    identity_store_id = tolist(data.aws_ssoadmin_instances.current.identity_store_ids)[0]
    display_name = "The0x_IDC"
    user_name = "the0x"

    name {
        given_name = "the0x"
        family_name = "the0x"
    }

    emails {
        value = var.email
    }
}

resource "aws_ssoadmin_permission_set" "readOnly" {
    name = "TF_MANAGED_READ_ONLY"
    instance_arn = tolist(data.aws_ssoadmin_instances.current.arns)[0]
}

resource "aws_ssoadmin_managed_policy_attachment" "the0x" {
    instance_arn = tolist(data.aws_ssoadmin_instances.current.arns)[0]
    permission_set_arn = aws_ssoadmin_permission_set.readOnly.arn
    managed_policy_arn = "arn:aws:iam::aws:policy/job-function/ViewOnlyAccess"
}

resource "aws_ssoadmin_account_assignment" "the0x" {
    instance_arn = tolist(data.aws_ssoadmin_instances.current.arns)[0]
    permission_set_arn = aws_ssoadmin_permission_set.readOnly.arn
    principal_id = aws_identitystore_user.the0x.user_id
    principal_type = "USER"
    target_id = data.aws_organizations_organization.current.master_account_id
    target_type = "AWS_ACCOUNT"
}