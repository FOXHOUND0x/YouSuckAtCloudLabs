module "policy_definitions" {
    source = "../../../modules/Basics/Policy-Definitions"
    name = var.name
    policy_type = var.policy_type
    mode = var.mode
    display_name = var.display_name
    description = var.description
    scope = var.scope

    policy_rule = <<POLICY_RULE
{
    "if": {
        "not": {
            "field": "[concat('tags[', '${var.tag_name}', ']')]",
            "exists": "true"
        }
    },
    "then": {
        "effect": "deny"
    }
}
POLICY_RULE
}