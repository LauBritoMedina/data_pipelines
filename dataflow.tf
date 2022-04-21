
resource "google_dataflow_job" "big_data_job" {
  name              = var.dataflow_job_name
  project           = var.project
  region            = var.region
  template_gcs_path = "gs://dataflow-templates-us-central1/latest/PubSub_Subscription_to_BigQuery"
  temp_gcs_location = "${google_storage_bucket.temp-location.url}/tmp-dir"
  parameters = {
    inputSubscription=google_pubsub_subscription.default_subs.path,
    outputTableSpec="${google_bigquery_table.default_table.project}:${google_bigquery_table.default_table.dataset_id}.${google_bigquery_table.default_table.table_id}"
    
  }

  depends_on = [
      google_storage_bucket.temp-location,
      google_bigquery_table.default_table,
      google_pubsub_subscription.default_subs,
      google_pubsub_topic.default_topic
  ]
}



