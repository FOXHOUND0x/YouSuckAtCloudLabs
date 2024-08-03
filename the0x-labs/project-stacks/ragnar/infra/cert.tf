resource "aws_acm_certificate" "ragnar_cert" {
    domain_name = "ragnar.the0x.dev"
    validation_method = "DNS"

    lifecycle {
        create_before_destroy = true
    }
}

data "cloudflare_zone" "ragnar_zone" {
    name = "the0x.dev"
}

resource "cloudflare_record" "ragnar_cert_validation_records" {
    count = length(aws_acm_certificate.ragnar_cert.domain_validation_options)

    zone_id = data.cloudflare_zone.ragnar_zone.id
    name = element(aws_acm_certificate.ragnar_cert.domain_validation_options.*.resource_record_name, count.index)
    type = element(aws_acm_certificate.ragnar_cert.domain_validation_options.*.resource_record_type, count.index)
    value = element(aws_acm_certificate.ragnar_cert.domain_validation_options.*.resource_record_value, count.index)
    ttl = 60
}