terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.32.0"
    }
  }
}

provider "google" {
    project = var.project_id
    region  = var.region
    zone    = var.zone
}