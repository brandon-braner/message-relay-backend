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
    google-beta = {
      source = "hashicorp/google-beta"
      version = "4.28.0"
    }
  }
}

provider "google-beta" {
    region      = "us-central1"
}
