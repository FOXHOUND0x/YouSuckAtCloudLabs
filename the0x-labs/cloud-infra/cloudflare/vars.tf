variable "CLOUDFLARE_ACCOUNT_ID" {
    description = "Cloudflare Account ID"
    type        = string
    default     = "6295a524290ca743311dd1795af1fbd6"
}

variable "CLOUDFLARE_EMAIL_NOTIFICATION_ADDRESS" {
    description = "Cloudflare Email Notification Address"
    type        = string
    default     = "ysac@the0x.dev"
}

variable "CLOUDFLARE_API_TOKEN" {
    description = "Cloudflare API Token"
    type        = string
    default     = "MMgFkTPelMLRMG1dYpaWBzgCNhbvU1_Slh-rWJmt"
}

variable "CLOUDFLARE_ZONE_ID" {
    description = "Cloudflare Zone ID"
    type        = string
    default     = "c60f99b808744e12bb49e1bcf82904be"
}

variable "CLOUDFLARE_CAARD_ACME" {
    description = "Cloudflare CAARD ACME"
    type        = string
    default     = "ysac.the0x.dev.e19495872d45cfe6.dcv.cloudflare.com"
}

variable "CLOUDFLARE_A_RECORD" {
    description = "Cloudflare A Record"
    type        = string
    default     = "172.66.0.70"
}

variable "CLOUDFLARE_TXT_RECORD" {
    description = "Cloudflare TXT Record"
    type        = string
    default     = "v=spf1 include:_spf.mx.cloudflare.net ~all"
}