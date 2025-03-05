module "workload_pool_identity" {
  source = "git@github.com:GestaltCaius/gcp-workload-identity-federation.git?ref=main"

  project_id         = var.project_id
  cicd_roles         = var.cicd_roles
  identity_providers = var.identity_providers
}
