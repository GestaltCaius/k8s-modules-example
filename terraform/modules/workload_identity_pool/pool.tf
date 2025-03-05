resource "google_iam_workload_identity_pool" "pool" {
  workload_identity_pool_id = "cicd"
  display_name              = "CICD pipelines"
  description               = "Identity pool for automated pipelines"
  lifecycle {
    prevent_destroy = true
  }
}

resource "google_iam_workload_identity_pool_provider" "cicd_providers" {
  for_each                           = var.identity_providers
  workload_identity_pool_id          = google_iam_workload_identity_pool.pool.workload_identity_pool_id
  workload_identity_pool_provider_id = "cicd-runner-${each.key}"
  display_name                       = "CICD runner ${each.key}"
  description                        = "CICD runner ${each.key} identity pool provider"
  attribute_condition                = each.value.attribute_condition
  attribute_mapping                  = each.value.attribute_mapping
  oidc {
    issuer_uri = each.value.issuer_uri
  }
  lifecycle {
    prevent_destroy = true
  }
}
