resource "google_container_cluster" "primary" {
  name                     = "my-gke-cluster"
  location                 = var.region
  remove_default_node_pool = true
  initial_node_count       = 1
  gateway_api_config {
    channel = "CHANNEL_STANDARD"
  }
  deletion_protection = false
  network             = data.google_compute_network.gke.name
  subnetwork          = data.google_compute_subnetwork.gke_subnet.name
  # required to enable workload identity
  workload_identity_config {
    workload_pool = "${data.google_client_config.default.project}.svc.id.goog"
  }
  cost_management_config {
    enabled = true
  }
}

resource "google_container_node_pool" "spot_pool" {
  name       = "spot-pool"
  location   = var.region
  cluster    = google_container_cluster.primary.name
  node_count = null

  autoscaling {
    total_min_node_count = 1
    total_max_node_count = 30
    location_policy      = "ANY" # ANY reduces risks of SPOT VM preemption
  }

  node_config {
    tags            = ["gke-gateway", "spot-pool"]
    spot            = true
    machine_type    = "e2-standard-2"
    service_account = google_service_account.gke.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    # required to enable workload identity on node pool
    workload_metadata_config {
      mode = "GKE_METADATA"
    }
  }
}

data "google_client_config" "default" {
}
