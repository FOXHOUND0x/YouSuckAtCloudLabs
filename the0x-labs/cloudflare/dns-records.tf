resource "cloudflare_record" "hashnode_cname" {
    zone_id = var.CLOUDFLARE_ZONE_ID
    name    = "blog.ysac"
    value   = "hashnode.network"
    type    = "CNAME"
    ttl     = 1
}

resource "cloudflare_record" "caard_acme" {
    zone_id = var.CLOUDFLARE_ZONE_ID
    name    = "_acme-challenge.ysac"
    value   = var.CLOUDFLARE_CAARD_ACME
    type    = "CNAME"
    ttl     = 1
}

resource "cloudflare_record" "a_record" {
    zone_id = var.CLOUDFLARE_ZONE_ID
    name    = "ysac"
    value   = var.CLOUDFLARE_A_RECORD
    type    = "A"
    ttl     = 1
}

resource "cloudflare_record" "txt_record" {
    zone_id = var.CLOUDFLARE_ZONE_ID
    name    = "ysac"
    value   = var.CLOUDFLARE_TXT_RECORD
    type    = "TXT"
    ttl     = 1
}