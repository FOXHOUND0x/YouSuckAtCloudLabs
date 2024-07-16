locals {
  ai-team = [
  ]
}

resource "aws_identitystore_group" "ai_group" {
  display_name      = "AI-Team"
  description       = "Members of the AI team who will be using sagemaker and other AI services"
  identity_store_id = var.id_store_id
}

resource "aws_identitystore_group_membership" "ai_group_membership" {
  for_each = { for user in local.ai-team : user.username => user }
  identity_store_id = var.id_store_id
  group_id = aws_identitystore_group.ai_group.group_id
  member_id = each.value.userId
}