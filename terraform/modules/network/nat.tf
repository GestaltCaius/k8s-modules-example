resource "google_compute_router" "router" {
  name    = "gke-router"
  network = google_compute_network.gke.id
  #   region  = var.region
}

resource "google_compute_router_nat" "nat" {
  name   = "gke-nat"
  router = google_compute_router.router.name
  #   region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  auto_network_tier                  = "STANDARD"
}