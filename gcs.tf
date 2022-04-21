
resource "google_storage_bucket" "temp-location" {
  name          = "job-temp-location-bucket"
  project           = var.project
  location      = "EU"
  force_destroy = true
}