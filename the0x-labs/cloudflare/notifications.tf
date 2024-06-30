resource "cloudflare_notification_policy" "traffic_anomalies_alert" {
    account_id = var.CLOUDFLARE_ACCOUNT_ID
    name       = "Traffic Anomalies Alert"
    description = "Alert on traffic anomalies"
    enabled    = true
    alert_type = "health_check_status_notification"

    email_integration {
        id = var.CLOUDFLARE_EMAIL_NOTIFICATION_ADDRESS
    }

    filters {
    health_check_id = ["699d98642c564d2e855e9661899b7252"]
    status          = ["Unhealthy"]
  }
}

resource "cloudflare_notification_policy" "ssl_expiration_alert" {
    account_id = var.CLOUDFLARE_ACCOUNT_ID
    name       = "SSL Expiration Alert"
    description = "Alert on SSL expiration"
    enabled    = true
    alert_type = "universal_ssl_event_type"

    email_integration {
        id = var.CLOUDFLARE_EMAIL_NOTIFICATION_ADDRESS
    }
}
