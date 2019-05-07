
// GKE Cluster
resource "google_container_cluster" "gke_cluster" {
  enable_legacy_abac = "false"
  initial_node_count = "${var.gke_initial_node_count}"
  min_master_version = "${var.gke_k8s_version}"
  node_version       = "${var.gke_k8s_version}"
  name               = "${var.gke_cluster_name}"
  # network    = "${data.google_compute_network.gke_network.id}"
  # subnetwork = "cluster-net"
  # project            = "${var.project}"
  remove_default_node_pool = true
  zone               = "${var.gke_region}"
  # ip_allocation_policy = {
  #   cluster_secondary_range_name  = "pod-net"
  #   services_secondary_range_name = "svc-net"
  # }

  additional_zones = [
    "${var.gke_zone}",
    "${var.gke_zone2}",
    "${var.gke_zone3}",
  ]
  addons_config {
    http_load_balancing {
      disabled = false
    }
    horizontal_pod_autoscaling {
      disabled = false
    }
    # Istio not supported until google provider 2.0.0 https://github.com/terraform-providers/terraform-provider-google-beta
    # istio_config {
    #   disabled = false
    # }
  }

  # If you don't want to prevent against accidentally destruction, enable this
  # lifecycle {
  #   prevent_destroy = true
  # }

  master_auth {
    username = ""
    password = ""
  }
}

// GKE Cluster Node Pool
resource "google_container_node_pool" "np" {
  cluster    = "${google_container_cluster.gke_cluster.name}"
  name       = "${var.gke_node_pool_name}"
  node_count = "${var.gke_initial_node_count}"
  # project    = "${var.project}"
  region     = "${var.gke_region}"

  autoscaling {
    min_node_count = "${var.gke_min_node_count}"
    max_node_count = "${var.gke_max_node_count}"
  }

  # If you don't want to prevent against accidentally destruction, enable this
  lifecycle {
    prevent_destroy = true
  }

  management {
    auto_repair = "${var.gke_auto_repair}"
    auto_upgrade = "${var.gke_auto_upgrade}"
  }

  node_config {
    disk_size_gb = "${var.gke_disk_size_gb}"
    disk_type    = "${var.gke_disk_type}"
    image_type   = "${var.gke_image_type}"
    machine_type = "${var.gke_machine_type}"
    preemptible  = false

    labels = {
      cluster_name = "${var.gke_cluster_name}"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/devstorage.read_write",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/trace.append",
      "https://www.googleapis.com/auth/cloud_debugger",
    ]
  }

  timeouts {
    create = "30m"
    update = "40m"
    delete = "30m"
  }
}
