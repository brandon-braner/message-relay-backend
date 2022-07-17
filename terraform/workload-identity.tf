resource "google_iam_workload_identity_pool" "gh_identity_pool" {
  provider                  = google-beta
  project                   = local.env[terraform.workspace].project
  workload_identity_pool_id = "github-pool"
  display_name              = "Github pool"
  description               = "Identity pool for Github action builds"
  disabled                  = false
}

resource "google_iam_workload_identity_pool_provider" "gh_identity_pool_provider" {
  provider                           = google-beta
  project                            = local.env[terraform.workspace].project
  workload_identity_pool_id          = google_iam_workload_identity_pool.gh_identity_pool.workload_identity_pool_id
  workload_identity_pool_provider_id = "gh-provider"
  attribute_mapping                  = {
    "google.subject" = "assertion.sub"
    "attribute.full" = "assertion.repository+assertion.ref"
  }
  oidc {
    issuer_uri        = "https://token.actions.githubusercontent.com"
  }
}

data "google_iam_policy" "gh_policy" {
  binding {
    role = "roles/iam.workloadIdentityUser"
    members = [
      "principalSet://iam.googleapis.com/projects/512259185078/locations/global/workloadIdentityPools/github-pool/attribute.full/message-relay-dev+develop",
    ]
  }
}
