### GKE
output "client_certificate" {
  value = "${module.gke.client_certificate}"
}

output "client_key" {
  value = "${module.gke.client_key}"
}

output "cluster_ca_certificate" {
  value = "${module.gke.cluster_ca_certificate}"
}

output "gke_additional_zones" {
  value = "${module.gke.gke_additional_zones}"
}

output "gke_cluster_name" {
  value = "${module.gke.gke_cluster_name}"
}

output "gke_cluster_zone" {
  value = "${module.gke.gke_cluster_zone}"
}

output "gke_endpoint" {
  value = "${module.gke.gke_endpoint}"
}

output "gke_node_version" {
  value = "${module.gke.gke_node_version}"
}