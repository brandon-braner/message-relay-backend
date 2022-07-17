terraform {
  backend "gcs" {
    bucket = "message-relay-tf-state"
    prefix = "backend"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.28.0"
    }
  }
}