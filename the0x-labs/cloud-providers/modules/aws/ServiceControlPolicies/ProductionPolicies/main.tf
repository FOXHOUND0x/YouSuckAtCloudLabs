data "aws_organizations_organization" "organization" {}

locals {
    account_ids = {
        INFRASTRUCTURE = "946611947052"
        SECURITY       = "954093664884"
        AUDIT          = "970640229580"
        LOGGING        = "135346503038"
        ECOM_PROD      = "280420224304"
        ANA_PROD       = "702226105286"
    }

    accountIds = flatten([
        for account_id in local.account_ids : account_id
    ])
}

resource "aws_organizations_policy" "production_level_scp" {
    name        = var.policy_name
    description = var.policy_description
    content     = var.policy_content
    type        = "SERVICE_CONTROL_POLICY"
}

resource "aws_organizations_policy_attachment" "production_level_scp_attachment" {
    count       = length(local.account_ids)
    policy_id   = aws_organizations_policy.production_level_scp.id
    target_id   = local.accountIds[count.index]
}