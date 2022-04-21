variable "project" { }

variable "region" {
  default = "europe-west1" 
}

variable "bq_out_dataset_id" {
    default = "outDataset"
} 

variable "bq_out_table_id" {
    default = "out_table"
} 

variable "dataflow_job_name" {
    default = "default_dataflow_job"
} 

variable "pubsub_topic_name" {
    default = "default_tf_topic"
} 

variable "pubsub_subs_name" {
    default = "default_tf_subs"
} 