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
