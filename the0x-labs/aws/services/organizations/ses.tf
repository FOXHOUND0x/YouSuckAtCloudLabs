resource "aws_route53_zone" "account_provisioner" {
    provider = aws.security
    name = var.route53_record_name
}

resource "aws_route53_record" "txt_record" {
    provider = aws.security
    zone_id = aws_route53_zone.account_provisioner.zone_id
    name    = "_amazonses.${var.route53_record_name}"
    type    = "TXT"
    ttl     = "60"
    records = ["${aws_ses_domain_identity.account_provisioner.verification_token}"]
}

resource "aws_route53_record" "cname_records" {
    provider = aws.security
    count = 3 
    zone_id = aws_route53_zone.account_provisioner.zone_id
    name = "${aws_ses_domain_dkim.account_provisioner_dkim.dkim_tokens[count.index]}._domainkey"
    type = "CNAME"
    ttl = "60"
    records = ["${aws_ses_domain_dkim.account_provisioner_dkim.dkim_tokens[count.index]}.dkim.amazonses.com"]
}

resource "aws_ses_domain_identity" "account_provisioner" {
    provider = aws.security
    domain = var.route53_record_name
}

resource "aws_ses_domain_dkim" "account_provisioner_dkim" {
    provider = aws.security
    domain = aws_ses_domain_identity.account_provisioner.domain
}