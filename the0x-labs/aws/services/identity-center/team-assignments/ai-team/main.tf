module "ai_base" {
  source = "../../modules/CustomPermissions"
  permission_set_name = "locked-ai-based"
  group_id = ""
  account_names = [""]
  policy = ""
}