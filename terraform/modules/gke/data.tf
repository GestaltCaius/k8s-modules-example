data "google_compute_network" "gke" {
  name = var.vpc_name
}

data "google_compute_subnetwork" "gke_subnet" {
  self_link = var.subnet_self_link
}
