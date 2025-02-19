provider "google" {
  # Configuration options
  default_labels                                = var.default_labels
  add_terraform_attribution_label               = true
  terraform_attribution_label_addition_strategy = "PROACTIVE"
  region                                        = var.region
  project                                       = var.project_id
}
