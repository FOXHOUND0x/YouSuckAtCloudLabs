module "ai_team_set" {
    source = "./assignments/ai-team"
    id_store_id = data.aws_ssoadmin_instances.current.identity_store_ids[0]
}
