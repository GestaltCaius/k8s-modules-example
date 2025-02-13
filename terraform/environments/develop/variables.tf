variable "region" {
  description = "GCP region"
  type        = string
}

variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "default_labels" {
  description = "GCP resources default labels"
  type        = map(string)
}

variable "services" {
  description = "GCP services to enable"
  type        = set(string)
}

variable "kubernetes_service_accounts" {
  description = "KSA to create in K8s cluster (and their GCP IAM roles)"
  type = map(
    object({
      name      = string
      namespace = string
      roles     = list(string)
    })
  )
}

variable "helm_service_accounts" {
  description = "KSA and helm chart mapping"
  type        = map(string)
}
