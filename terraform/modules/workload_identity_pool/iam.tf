# Give provider identity IAM roles
resource "google_project_iam_member" "provider_identity_roles" {
  for_each = merge([
    for kp, vp in var.identity_providers : {
      for r in var.cicd_roles :
      "${kp}_${r}" => merge(vp, { role = r })
    }
  ]...)
  project = var.project_id
  role    = each.value.role
  member  = "principal://iam.googleapis.com/${google_iam_workload_identity_pool.pool.name}/subject/${each.value.subject}"
}

# Create a CICD service account as well, if some CIs want to use SA instead of their provider identity
resource "google_service_account" "cicd" {
  account_id   = "cicd-runner"
  display_name = "CICD runner SA"
}

resource "google_project_iam_member" "cicd_roles" {
  for_each = var.cicd_roles
  project  = var.project_id
  role     = each.value
  member   = google_service_account.cicd.member
}

# Authorize providers identity to impersonate the CICD service account
resource "google_service_account_iam_member" "gitlab_impersonate_sa" {
  for_each           = var.identity_providers
  service_account_id = google_service_account.cicd.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "principal://iam.googleapis.com/${google_iam_workload_identity_pool.pool.name}/subject/${each.value.subject}"
}
