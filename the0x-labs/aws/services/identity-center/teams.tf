module "ai_team_set" {
    source = "./entitlements/ai-team"
    id_store_id = data.aws_ssoadmin_instances.current.identity_store_ids[0]
}
module "gozer_team" {
    source = "./entitlements/platform_team"
    id_store_id = data.aws_ssoadmin_instances.current.identity_store_ids[0]
}
module "cloud_foundations" {
    source = "./entitlements/cloud_foundations"
    id_store_id = data.aws_ssoadmin_instances.current.identity_store_ids[0]
}