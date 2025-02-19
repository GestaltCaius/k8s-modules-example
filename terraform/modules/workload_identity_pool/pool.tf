resource "google_iam_workload_identity_pool" "pool" {
  workload_identity_pool_id = "cicd"
  display_name              = "CICD pipelines"
  description               = "Identity pool for automated pipelines"
}

resource "google_iam_workload_identity_pool_provider" "gh_actions" {
  workload_identity_pool_id          = google_iam_workload_identity_pool.pool.workload_identity_pool_id
  workload_identity_pool_provider_id = "cicd-runner"
  display_name                       = "CICD runner"
  description                        = "CICD runner identity pool provider"
  attribute_condition                = var.attribute_condition
  attribute_mapping                  = var.attribute_mapping
  oidc {
    issuer_uri = var.issuer_uri
  }
}
