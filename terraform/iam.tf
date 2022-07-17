resource "google_service_account" "sa" {
  project        = local.env[terraform.workspace].project
  account_id     = "${local.svc}-${terraform.workspace}"
}


resource "google_project_iam_binding" "sa_token_creator" {
  project = local.env[terraform.workspace].project
  role    = "roles/iam.serviceAccountTokenCreator"
  members = ["serviceAccount:${google_service_account.sa.email}"]
}

resource "google_project_iam_binding" "sa_service_account_user" {
  project = local.env[terraform.workspace].project
  role    = "roles/iam.serviceAccountUser"
  members = ["serviceAccount:${google_service_account.sa.email}"]
}

# Cloud Run
resource "google_cloud_run_service_iam_binding" "sa_cr_admin" {
  location = google_cloud_run_service.backend_cloud_run.location
  project  = google_cloud_run_service.backend_cloud_run.project
  service  = google_cloud_run_service.backend_cloud_run.name
  role     = "roles/run.admin"
  members  = ["serviceAccount:${google_service_account.sa.email}"]
}

resource "google_cloud_run_service_iam_binding" "binding" {
  location = google_cloud_run_service.backend_cloud_run.location
  service = google_cloud_run_service.backend_cloud_run.name
  project  = google_cloud_run_service.backend_cloud_run.project
  role = "roles/run.invoker"
  members = ["allUsers"]
}

resource "google_project_iam_member" "sa_cr_admin" {
  project = local.env[terraform.workspace].project
  role    = "roles/run.admin"
  member = "serviceAccount:${google_service_account.sa.email}"
}

# Storage Buckets
resource "google_storage_bucket_iam_binding" "sa_storage_admin" {
  bucket = google_storage_bucket.tf-state.name
  role = "roles/storage.admin"
  members = ["serviceAccount:${google_service_account.sa.email}"]
}

# buckets for gcr
resource "google_storage_bucket_iam_binding" "sa_storage_gcr" {
  bucket = "artifacts.message-relay-dev.appspot.com"
  role = "roles/storage.admin"
  members = ["serviceAccount:${google_service_account.sa.email}"]
}

resource "google_storage_bucket_iam_binding" "sa_storage_gcr_us" {
  bucket = "us.artifacts.message-relay-dev.appspot.com"
  role = "roles/storage.admin"
  members = ["serviceAccount:${google_service_account.sa.email}"]
}
