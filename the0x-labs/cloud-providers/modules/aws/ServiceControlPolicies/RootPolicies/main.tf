data "aws_organizations_organization" "organization" {}

resource "aws_organizations_policy" "policy" {
    name        = var.policy_name
    description = var.policy_description
    content     = var.policy_content
    type        = "SERVICE_CONTROL_POLICY"
}

resource "aws_organizations_policy_attachment" "attachment" {
    policy_id = aws_organizations_policy.policy.id
    target_id = data.aws_organizations_organization.organization.roots[0].id
}
