resource "google_project_service" "project" {
  for_each                   = var.services
  service                    = each.value
  disable_dependent_services = true
}