resource "google_project_iam_member" "ksa_roles" {
  for_each = local.ksa_roles
  project  = var.project_id
  role     = each.value.role
  member   = "principal://iam.googleapis.com/projects/${data.google_project.project.number}/locations/global/workloadIdentityPools/${var.project_id}.svc.id.goog/subject/ns/${each.value.namespace}/sa/${each.value.name}"
}

