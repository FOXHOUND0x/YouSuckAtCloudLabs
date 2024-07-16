data "aws_ssoadmin_instances" "current" {}
data "aws_organizations_organization" "current" {}

data "aws_ssoadmin_permission_set" "current" {
    instance_arn = data.aws_ssoadmin_instances.current.arns[0]
    name         = "AWSAdministratorAccess"
}