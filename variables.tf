### Global
variable project {
  description = "GCP Project"
}

variable region {
  description = "Region"
}

### GKE
variable gke_auto_repair {
  description = "Whether to enable auto repair on the pool nodes or not"
  default     = "true"
}

variable gke_auto_upgrade {
  description = "Whether to enable automatic node upgrades or not."
  default     = "false"
}

variable gke_cluster_name {
  description = "The name of the kubernetes cluster. Note that nodes names will be prefixed with `k8s-`"
}

variable gke_disk_size_gb {
  description = "GKE Nodes Disk Size"
  default     = "100"
}

variable gke_disk_type {
  description = "GKE Nodes Disk Type"
  default     = "pd-standard"
}

variable gke_image_type {
  description = "Image type"
  default     = "COS"
}

variable gke_initial_node_count {
  description = "Initial Number of GKE Nodes"
  default     = "1"
}

variable gke_k8s_version {
  description = "Kubernetes Version"
  default     = "1.11.7-gke.4"
}

variable gke_machine_type {
  description = "Machine Type"
  default     = "n1-highmem-2"
}

variable gke_max_node_count {
  description = "Autoscaling Min Number of GKE Nodes"
  default     = "3"
}

variable gke_min_node_count {
  description = "Autoscaling Min Number of GKE Nodes"
  default     = "1"
}

variable gke_node_pool_name {
  description = "The name of the kubernetes node pool cluster"
}

variable gke_region {
  description = "Region"
}

variable gke_zone {
  description = "Zone"
}

variable gke_zone2 {
  description = "Additional Zone"
}

variable gke_zone3 {
  description = "Additional Zone"
}
