data "aws_ssoadmin_instances" "current" {}
data "aws_organizations_organization" "accts" {}

locals {
  account_names = var.account_names
  use_all_accounts = local.account_names == ["ALL"]

  all_accounts_map = {
    for account in data.aws_organizations_organization.accts.accounts :
    account.name => account.id
    if account.id != "785139483211" && account.id != "708264314518"
  }

  selected_accounts_map = {
    for account_name in local.account_names :
    account_name => lookup(local.all_accounts_map, account_name, null)
    if lookup(local.all_accounts_map, account_name, null) != null
  }
  
}