// Google Cloud provider
provider "google" {
  credentials = "${file("./gcloud-service-account")}"
  project     = "${var.project}"
  region      = "${var.region}"
}

// GKE
module "gke" {
  source             = "./resources/gke"
  gke_auto_repair    = "${var.gke_auto_repair}"
  gke_auto_upgrade   = "${var.gke_auto_upgrade}"
  gke_cluster_name   = "${var.gke_cluster_name}"
  gke_disk_size_gb   = "${var.gke_disk_size_gb}"
  gke_disk_type      = "${var.gke_disk_type}"
  gke_image_type     = "${var.gke_image_type}"
  gke_initial_node_count = "${var.gke_initial_node_count}"
  gke_k8s_version    = "${var.gke_k8s_version}"
  gke_machine_type   = "${var.gke_machine_type}"
  gke_max_node_count = "${var.gke_max_node_count}"
  gke_min_node_count = "${var.gke_min_node_count}"
  gke_node_pool_name = "${var.gke_node_pool_name}"
  gke_region         = "${var.gke_region}"
  gke_zone           = "${var.gke_zone}"
  gke_zone2          = "${var.gke_zone2}"
  gke_zone3          = "${var.gke_zone3}"
}