terraform {
  required_version = ">= 1.5, < 2"

  backend "gcs" {
    bucket = "OVERRIDE_ME"
    prefix = "terraform/state"
  }
}
