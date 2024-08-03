data "azurerm_monitor_action_group" "slack_ping_action" {
    resource_group_name = var.resource_group_name
    name               = "slack-ping-action"
}

output "action_group_id" {
    value = data.azurerm_monitor_action_group.slack_ping_action.id
}