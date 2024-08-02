data "aws_organizations_organization" "organization" {}

locals {
    account_ids = {
        IDENTITY_CENTER = "339713072021"
    }

    accountIds = flatten([
        for account_id in local.account_ids : account_id
    ])
}

resource "aws_organizations_policy" "identity_center_scp" {
    name        = var.policy_name
    description = var.policy_description
    content     = var.policy_content
    type        = "SERVICE_CONTROL_POLICY"
}

resource "aws_organizations_policy_attachment" "identity_center_scp_attachment" {
    count       = length(local.account_ids)
    policy_id   = aws_organizations_policy.identity_center_scp.id
    target_id   = local.accountIds[count.index]
}
