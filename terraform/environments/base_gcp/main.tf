module "workload_pool_identity" {
  source = "../../modules/workload_identity_pool"

  issuer_uri = "https://token.actions.githubusercontent.com"
  project_id = var.project_id
  cicd_roles = [
    "roles/storage.admin",
  ]
  subject = "GestaltCaius/k8s-modules-example"

  attribute_mapping = {
    # "google.subject"                  = "assertion.sub"
    "google.subject"                  = "assertion.repository"
    "attribute.actor"                 = "assertion.actor"
    "attribute.aud"                   = "assertion.aud"
    "attribute.repository"            = "assertion.repository"
    "attribute.repository_owner"      = "assertion.repository_owner"
    "attribute.actor_id"              = "assertion.actor_id"
    "attribute.repository_visibility" = "assertion.repository_visibility"
    "attribute.repository_id"         = "assertion.repository_id"
    "attribute.repository_owner_id"   = "assertion.repository_owner_id"
  }

  attribute_condition = <<EOT
    attribute.repository == "GestaltCaius/k8s-modules-example"
    EOT
}
