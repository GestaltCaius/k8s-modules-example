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

variable "cicd_roles" {
  type = set(string)
}

variable "identity_providers" {
  type = map(object({
    issuer_uri          = string
    attribute_mapping   = map(string)
    attribute_condition = string
    subject             = string
  }))
}