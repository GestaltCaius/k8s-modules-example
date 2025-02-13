resource "kubernetes_service_account" "ksa" {
  for_each = var.kubernetes_service_accounts
  metadata {
    name      = each.value.name
    namespace = each.value.namespace
    annotations = {
      "created-by" : "terraform-rbac-module"
    }
  }
}
