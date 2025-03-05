variable "project_id" {
  type = string
}

variable "cicd_roles" {
  description = "List of IAM roles to grant to CICD service account and CICD runners"
  type        = set(string)
}

variable "identity_providers" {
  description = "List of identity providers to create in the GCP workload identity pool"

  type = map(object({
    issuer_uri          = string
    attribute_mapping   = map(string)
    attribute_condition = string
    subject             = string
  }))

  default = {
    github = {
      issuer_uri = "https://token.actions.githubusercontent.com"
      subject    = "my-org/my-repo"
      attribute_mapping = {
        "google.subject"       = "assertion.sub"
        "attribute.repository" = "assertion.repository"
      }
      attribute_condition = <<EOT
        attribute.repository == "my-org/my-repo"
        EOT
    },
  }
}
