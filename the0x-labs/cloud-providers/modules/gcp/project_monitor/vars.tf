variable "project_id" {
    description = "The project ID to monitor"
    type        = string
}

variable "SLACK_AUTH_TOKEN" {
    description = "The Slack auth token to use for the Slack notification channel"
    type        = string
}