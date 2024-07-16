resource "azurerm_policy_definition" "enforceTaggingPolicy" {
  name         = "enforceTaggingPolicy"
  policy_type  = "Custom"
  mode         = "Indexed"
  display_name = "Enforce Tagging Policy"
  description  = "This policy ensures that tags are present on all resources."

  policy_rule = jsonencode({
    "if": {
      "field": "tags",
      "exists": "false"
    },
    "then": {
      "effect": "deny"
    }
  })
}

resource "azurerm_resource_policy_assignment" "enforceTaggingAssignment" {
  name                 = "enforceTaggingAssignment"
  resource_id          = azurerm_policy_definition.enforceTaggingPolicy.id
  policy_definition_id = azurerm_policy_definition.enforceTaggingPolicy.id
}