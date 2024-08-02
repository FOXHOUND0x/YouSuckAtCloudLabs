locals {
  0xSec-Team = [
  ]
}

resource "aws_identitystore_group" "ai_group" {
  display_name      = "0xSec-Team"
  description       = "the 0xsec dev team"
  identity_store_id = var.id_store_id
}

resource "aws_identitystore_group_membership" "ai_group_membership" {
  for_each = { for user in local.0xSec-Team : user.username => user }
  identity_store_id = var.id_store_id
  group_id = aws_identitystore_group.ai_group.group_id
  member_id = each.value.userId
}