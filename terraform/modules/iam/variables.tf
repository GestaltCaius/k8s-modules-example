variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "kubernetes_service_accounts" {
  description = "KSA and their IAM roles to create"
  type = map(
    object({
      name      = string
      namespace = string
      roles     = list(string)
    })
  )
}
