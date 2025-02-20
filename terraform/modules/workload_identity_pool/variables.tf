variable "issuer_uri" {
  type = string
}

variable "attribute_mapping" {
  type = map(string)
}

variable "attribute_condition" {
  type = string
}

variable "project_id" {
  type = string
}

variable "cicd_roles" {
  type = set(string)
}

variable "subject" {
  type = string
}