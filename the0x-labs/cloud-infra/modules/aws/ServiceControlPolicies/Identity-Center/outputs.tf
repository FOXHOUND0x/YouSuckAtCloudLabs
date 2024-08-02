output "policy_id" {
  description = "The ID of the policy"
  value       = "The Following Policy ID: ${aws_organizations_policy.identity_center_scp.id}"
}

