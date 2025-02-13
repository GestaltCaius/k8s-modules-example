locals {
  ksa_roles = merge([
    for ksa_k, ksa_v in var.kubernetes_service_accounts :
    { for role in ksa_v.roles : "${ksa_k}_${role}" => {
      name      = ksa_v.name,
      namespace = ksa_v.namespace,
      role      = role,
    } }
  ]...)
}
