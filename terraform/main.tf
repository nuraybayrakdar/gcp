provider "google" {
  credentials = file("/Users/nuraybayrakdar/Desktop/gcp/gcp-key.json")
  project     = var.project_id
  region      = var.region
}



resource "google_container_cluster" "primary" {
  name               = "gke-cluster"
  location           =  "europe-west1-b"
  remove_default_node_pool = true
  initial_node_count = 1

  logging_service    = "none"
  monitoring_service = "none"

  network    = "default"
  subnetwork = "default"

  deletion_protection = false
}

resource "google_container_node_pool" "main_pool" {
  name       = "main-pool"
  cluster    = google_container_cluster.primary.name
  location   = "europe-west1-b"
  node_count = 1

  node_config {
    machine_type = "n2d-standard-2"
  }

}

resource "google_container_node_pool" "application_pool" {
  name     = "application-pool"
  cluster  = google_container_cluster.primary.name
  location   = "europe-west1-b"

  autoscaling {
    min_node_count = 1
    max_node_count = 3
  }

  node_config {
    machine_type = "n2d-standard-2"
  }
}
