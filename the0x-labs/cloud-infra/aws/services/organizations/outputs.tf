output "account_ids" {
    value = data.aws_organizations_organization.current.accounts[*].id
}

output "organizational_unit_ids" {
    value = data.aws_organizations_organizational_units.current.id
}

output "txt_record" {
    value = aws_route53_record.txt_record.fqdn
}