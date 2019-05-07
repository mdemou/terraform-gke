output "client_certificate" {
  value = "${google_container_cluster.gke_cluster.master_auth.0.client_certificate}"
}

output "client_key" {
  value = "${google_container_cluster.gke_cluster.master_auth.0.client_key}"
}

output "cluster_ca_certificate" {
  value = "${google_container_cluster.gke_cluster.master_auth.0.cluster_ca_certificate}"
}

output "gke_additional_zones" {
  value = "${google_container_cluster.gke_cluster.additional_zones}"
}

output "gke_cluster_name" {
  value = "${google_container_cluster.gke_cluster.name}"
}

output "gke_cluster_zone" {
  value = "${google_container_cluster.gke_cluster.zone}"
}

output "gke_endpoint" {
  value = "${google_container_cluster.gke_cluster.endpoint}"
}

output "gke_node_version" {
  value = "${google_container_cluster.gke_cluster.node_version}"
}

# output "gke_service_account" {
#   value = "${google_service_account.gke_service_account.email}"
# }