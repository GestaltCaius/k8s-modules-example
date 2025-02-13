variable "kubernetes_service_accounts" {
  description = "KSA to create"
  type = map(
    object({
      name      = string
      namespace = string
    })
  )
}
