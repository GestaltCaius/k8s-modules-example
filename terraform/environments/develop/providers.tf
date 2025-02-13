provider "google" {
  # Configuration options
  default_labels                                = var.default_labels
  add_terraform_attribution_label               = true
  terraform_attribution_label_addition_strategy = "PROACTIVE"
  region                                        = var.region
  project                                       = var.project_id
}

provider "helm" {
  # to avoid writing permissions errors in CI runners
  # repository_cache       = "${path.cwd}/.helm"
  # repository_config_path = "${path.cwd}/.helm/repositories.yaml"
  kubernetes {
    host                   = module.gke.host
    token                  = module.gke.token
    cluster_ca_certificate = module.gke.cluster_ca_certificate
  }
}

provider "kubernetes" {
  host                   = "https://${module.gke.host}"
  token                  = module.gke.token
  cluster_ca_certificate = module.gke.cluster_ca_certificate
}

