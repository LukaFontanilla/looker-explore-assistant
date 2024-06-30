resource "google_bigquery_job" "create_explore_assistant_examples_table" {
  job_id = "create_explore_assistant_examples_table-${formatdate("YYYYMMDDhhmmss", timestamp())}"
  query {
    query              = <<EOF
    CREATE OR REPLACE TABLE `${google_bigquery_dataset.dataset.dataset_id}.explore_assistant_examples` (
        explore_id STRING OPTIONS (description = 'Explore id of the explore to pull examples for in a format of -> lookml_model:lookml_explore'),
        examples STRING OPTIONS (description = 'Examples for Explore Assistant training. JSON document with list hashes each with input and output keys.')
    )
  EOF  
    create_disposition = ""
    write_disposition  = ""
    allow_large_results = false
    flatten_results = false
    maximum_billing_tier = 0
    schema_update_options = [ ]
    use_legacy_sql = false
  }

  location = var.deployment_region
  depends_on = [ time_sleep.wait_after_apis_activate]

  lifecycle {
    ignore_changes  = [query, job_id]
  }
}


resource "google_bigquery_job" "create_explore_assistant_refinement_examples_table" {
  job_id = "create_explore_assistant_refinement_examples_table-${formatdate("YYYYMMDDhhmmss", timestamp())}"
  query {
    query              = <<EOF
    CREATE OR REPLACE TABLE `${google_bigquery_dataset.dataset.dataset_id}.explore_assistant_refinement_examples` (
        explore_id STRING OPTIONS (description = 'Explore id of the explore to pull examples for in a format of -> lookml_model:lookml_explore'),
        examples STRING OPTIONS (description = 'Examples for Explore Assistant training. JSON document with list hashes each with input and output keys.')
    )
  EOF  
    create_disposition = ""
    write_disposition  = ""
    allow_large_results = false
    flatten_results = false
    maximum_billing_tier = 0
    schema_update_options = [ ]
    use_legacy_sql = false
  }

  location = var.deployment_region
  depends_on = [ time_sleep.wait_after_apis_activate]
  lifecycle {
    ignore_changes  = [query, job_id]
  }
}
