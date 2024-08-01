module "my_base_role" {
    source = "../../../modules/aws/IdentityCenter/PermissionSetManagement/0xsec-rw"
    base_role_name = "base-locked-roles"
    base_locked_policy = "base-locked-roles"
    managed_policy_arns = module.base_locked_roles_policy.arn
}