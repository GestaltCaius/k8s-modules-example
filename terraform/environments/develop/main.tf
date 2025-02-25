module "rbac" {
  source                      = "../../modules/rbac"
  kubernetes_service_accounts = var.kubernetes_service_accounts
  depends_on = [
    module.services,
    module.iam,
    module.gke,
  ]
}

module "iam" {
  source                      = "../../modules/iam"
  project_id                  = var.project_id
  kubernetes_service_accounts = var.kubernetes_service_accounts
  depends_on = [
    module.services,
  ]
}

module "gcs" {
  source = "../../modules/gcs"
  region = var.region
  depends_on = [
    module.services,
  ]
}

module "helm" {
  source                 = "../../modules/helm"
  gcloud_service_account = var.helm_service_accounts["gcloud"]
  depends_on = [
    module.services,
    module.gke,
  ]
}

module "gke" {
  source           = "../../modules/gke"
  region           = var.region
  vpc_name         = module.network.vpc
  subnet_self_link = module.network.subnet
  labels           = var.default_labels
  master_authorized_networks = {
    rod = {
      cidr_block = "2.13.177.109/32"
      name       = "Rod home IP"
    }
    stack_labs_paris = {
      cidr_block = "85.68.91.249/32"
      name       = "Stack Labs Paris"
    }
    github_actions_runners = {
      cidr_block = "0.0.0.0/0"
      name       = "GH Actions Runners"
    }
  }
  depends_on = [
    module.services,
    module.network,
  ]
}

module "network" {
  source = "../../modules/network"
  depends_on = [
    module.services,
  ]
}

module "services" {
  source   = "../../modules/services"
  services = var.services
}
