resource "google_pubsub_topic" "project_monitor" {
  name = "project_monitor_pubsub"
}

resource "google_pubsub_subscription" "project_monitor" {
  name = "project_monitor"
  topic = google_pubsub_topic.project_monitor.name
}

resource "google_storage_bucket" "bucket" {
  name     = "infosec-project-monitor"
  location = "US"
  uniform_bucket_level_access = true
}

data "archive_file" "default" {
  type        = "zip"
  output_path = "/tmp/function-source.zip"
  source_dir  = "../../platforms/gcp/cloudfunctions/"
}

resource "google_storage_bucket_object" "object" {
  name   = "function-source.zip"
  bucket = google_storage_bucket.bucket.name
  source = data.archive_file.default.output_path
}

resource "google_cloudfunctions_function" "project_monitor" {
  name = "project_monitor"
  description = "Monitors project creation"
  runtime     = "python311"
  available_memory_mb = 128
  source_archive_bucket = google_storage_bucket.bucket.name
  source_archive_object = google_storage_bucket_object.object.name
  trigger_http = true
  entry_point = "main"
  environment_variables = {
    SLACK_AUTH_TOKEN = var.SLACK_AUTH_TOKEN
  }
}

resource "google_project_iam_member" "project" {
  project = var.project_id
  role    = "roles/viewer"
  member  = "serviceAccount:${google_cloudfunctions_function.project_monitor.service_account_email}"
}

resource "google_logging_project_sink" "log_sink" {
  name = "project_monitor_sink"
  destination = "pubsub.googleapis.com/${google_pubsub_topic.project_monitor.id}"
  filter = <<EOF
    resource.type="project"
    protoPayload.methodName="CreateProject"
  EOF
}

output "function_uri" {
  value = google_cloudfunctions_function.project_monitor.https_trigger_url
}