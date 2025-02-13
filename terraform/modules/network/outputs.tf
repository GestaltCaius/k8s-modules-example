output "vpc" {
  value = google_compute_network.gke.name
}

output "subnet" {
  value = google_compute_subnetwork.gke_nodes.self_link
}
