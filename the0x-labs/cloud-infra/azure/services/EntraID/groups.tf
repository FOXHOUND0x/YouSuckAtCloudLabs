data "azuread_client_config" "current" {}

resource "random_password" "password" {
  length           = 24
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "azuread_user" "the0xuser" {
  user_principal_name = "ysac@ysacthe0x.onmicrosoft.com"
  display_name        = "the0x"
  mail_nickname       = "the0x"
  password = random_password.password.result
}

resource "azuread_group" "the0x" {
  display_name     = "the0x"
  owners           = [data.azuread_client_config.current.object_id]
  security_enabled = true
}

resource "azuread_group_member" "the0x_membership" {
  group_object_id = azuread_group.the0x.id
  member_object_id = azuread_user.the0xuser.id
}