variable "region" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "subnet_self_link" {
  type = string
}

variable "labels" {
  description = "GCP labels to apply to resources"
  type        = map(string)
}

variable "master_authorized_networks" {
  description = "X"
  type = map(object({
    cidr_block = string
    name       = string
    }
  ))
}
