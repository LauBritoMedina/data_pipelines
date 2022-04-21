resource "google_bigquery_dataset" "bq_out_dataset" {
  project           = var.project
  dataset_id                  = var.bq_out_dataset_id
  friendly_name               = "test"
  description                 = "This is a test description"
  location                    = "EU"

  labels = {
    env = "default"
  }
}

resource "google_bigquery_table" "default_table" {
  dataset_id = google_bigquery_dataset.bq_out_dataset.dataset_id
  project           = var.project
  table_id   = var.bq_out_table_id

  time_partitioning {
    type = "DAY"
  }

  labels = {
    env = "default"
  }

  schema = <<EOF
[
  {
    "name": "permalink",
    "type": "STRING",
    "mode": "NULLABLE",
    "description": "The Permalink"
  },
  {
    "name": "state",
    "type": "STRING",
    "mode": "NULLABLE",
    "description": "State where the head office is located"
  }
]
EOF

}