# Enable GCP APIS
variable "gcp_service_list" {
  description ="The list of apis necessary for the project"
  type = list(string)
  default = [
    "compute.googleapis.com",
    "servicenetworking.googleapis.com",
    "run.googleapis.com",
    "artifactregistry.googleapis.com",
    "sts.googleapis.com"
  ]
}

resource "google_project_service" "gcp_services" {
  for_each = toset(var.gcp_service_list)
  project = local.env[terraform.workspace].project
  service = each.key
}

# Storage Buckets
resource "google_storage_bucket" "tf-state" {
  name     = "message-relay-tf-state"
  project  = local.env[terraform.workspace].project
  location = local.env[terraform.workspace].region
  uniform_bucket_level_access = true
}


resource "google_cloud_run_service" "backend_cloud_run" {
    name     = "message-relay-backend"
    project  = local.env[terraform.workspace].project
    location = local.env[terraform.workspace].region
    template {
      spec {
            containers {
                image = "gcr.io/message-relay-dev/message-relay"
            }
      }
    }
    traffic {
      percent         = 100
      latest_revision = true
    }
}


# Container Registry

resource "google_container_registry" "registry" {
  project  = local.env[terraform.workspace].project
  location = "US"
}
