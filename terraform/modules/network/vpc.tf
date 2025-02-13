resource "google_compute_network" "gke" {
  name                    = "gke-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "gke_nodes" {
  name          = "gke-nodes"
  ip_cidr_range = "10.0.0.0/17"
  network       = google_compute_network.gke.id
}
