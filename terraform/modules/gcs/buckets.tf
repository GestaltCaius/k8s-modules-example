resource "random_id" "gcs" {
  byte_length = 8
}

resource "google_storage_bucket" "example_data" {
  name                        = "example-data-${random_id.gcs.hex}"
  location                    = var.region
  force_destroy               = true
  uniform_bucket_level_access = true
}

resource "google_storage_bucket_object" "example_data" {
  for_each = fileset("${path.module}/files/", "*")
  name     = each.key
  source   = "${path.module}/files/${each.value}"
  bucket   = google_storage_bucket.example_data.name
}
