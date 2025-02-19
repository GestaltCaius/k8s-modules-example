resource "google_project_iam_member" "cicd_roles" {
  for_each = var.cicd_roles
  project  = var.project_id
  role     = each.value
  member   = "principal://iam.googleapis.com/${google_iam_workload_identity_pool.pool.name}/subject/attribute.repository"
}
