locals {
  env = {
    dev = {
      project = "message-relay-dev"
      region  = "us-central1"
      zone    = "us-central1-a"
    }
    prod = {
      project = "message-relay-prod"
      region  = "us-central1"
      zone    = "us-central1-a"
    }
  }
  svc         = "message-relay-backend"
}