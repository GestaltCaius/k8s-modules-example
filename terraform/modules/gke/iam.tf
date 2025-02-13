resource "google_service_account" "gke" {
  account_id   = "gke-autopilot-sa"
  display_name = "GKE SA"
}