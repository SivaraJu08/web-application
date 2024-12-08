provider "google" {
  project = "project-id"
  region  = "us-east1"
}

resource "google_container_cluster" "gke_cluster" {
  name     = "web-application"
  location = "us-east1-b"
  initial_node_count = 3

  node_config {
    machine_type = "e2-medium"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}

resource "google_container_node_pool" "default_node_pool" {
  cluster = google_container_cluster.gke_cluster.name
  location = google_container_cluster.gke_cluster.location

  node_count = 3
  node_config {
    machine_type = "e2-medium"
  }
}

output "kubeconfig" {
  value = google_container_cluster.gke_cluster.name
}
