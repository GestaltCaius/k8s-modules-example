resource "helm_release" "gcloud" {
  name  = "gcloud"
  chart = "${path.root}/../../../charts/gcloud"
  values = [
    file("${path.module}/values/gcloud.yaml"),
  ]

  set {
    name  = "serviceAccountName"
    value = var.gcloud_service_account
  }
}
