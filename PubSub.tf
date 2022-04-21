resource "google_pubsub_topic" "default_topic" {
  name = var.pubsub_topic_name
  project = var.project
}

resource "google_pubsub_subscription" "default_subs" {
  name              = var.pubsub_subs_name
  project           = var.project
  topic = google_pubsub_topic.default_topic.name

  labels = {
    foo = "bar"
  }

  # 20 minutes
  message_retention_duration = "1200s"
  retain_acked_messages      = true

  ack_deadline_seconds = 20

  expiration_policy {
    ttl = "300000.5s"
  }
  retry_policy {
    minimum_backoff = "10s"
  }

  enable_message_ordering    = false
}