resource "aws_organizations_organizational_unit" "idc-ou" {
    name      = "identity-center"
    parent_id = data.aws_organizations_organizational_unit.ou.id
}

resource "aws_organizations_account" "identity_center" {
    name = "fanatics-identity-center"
    email = "the0x-ai_base@${var.route53_record_name}"
    close_on_deletion = true
    iam_user_access_to_billing = "DENY"
    role_name = "OrganizationAccountAccessRole"
    tags = {
        Name = "identity-center"
        Environment = "production"
    }
}