# Terraform GKE

This is a quick guide to provision [Google Kubernetes Engine](https://cloud.google.com/kubernetes-engine/) using [Terraform](https://www.terraform.io/docs/providers/google/index.html)

## Before you begin

1. You'll need a [Google Cloud Platform](https://cloud.google.com/) account
2. Familiar with with [Kubernetes](https://kubernetes.io/), here's a good [Kubernetes Basics](https://kubernetes.io/docs/tutorials/kubernetes-basics/) tutorial.
3. Familiar with [Terraform](https://www.terraform.io/)
4. [gcloud SDK](https://cloud.google.com/sdk/) configured or you can use [Google Cloud Shell](https://cloud.google.com/shell/).

## Terrafom

### Usage

**1. Clone this repo.**

```
git clone https://github.com/mdemou/terraform-gke
```

> Add your credentials .json file to root `./gcloud-service-account.json`

**2. Create a .tfvars file into `tfvars` folder**

> There is already an `example.tfvars` file you can be inspired with

Default variables:

```
### Global
project = "PROJECT_NAME_HERE"
region  = "europe-west1"

### GKE
gke_auto_repair = true
gke_auto_upgrade = false
gke_cluster_name = "tf-example"
gke_disk_size_gb = "100"
gke_disk_type = "pd-standard"
gke_image_type = "COS"
gke_initial_node_count = "1"
gke_k8s_version = "1.11.8-gke.6"
gke_machine_type = "n1-standard-2"
gke_max_node_count = "3"
gke_min_node_count = "1"
gke_node_pool_name = "tf-pool"
gke_region = "europe-west1"
gke_zone = "europe-west1-b"
gke_zone2 = "europe-west1-c"
gke_zone3 = "europe-west1-d"
```

> Remember to replace project attribute with the one you own. It is the name of your Google Cloud Platform project

**3. Modify backend.tf file**

For remote state management, we are going to use a bucket. Edit `backend.tf` file with the values _bucket_ and _prefix_ with what you want. Make sure that bucket already exists and belongs to you.

> To manage state locally just delete _backend.tf_ file

**4. Prepare terraform**

`terraform init` - This will initialize terraform

**5. Workspace creation and usage**

`terraform workspace list` - This will list all available workspaces

`terraform workspace new testing` - This will create a workspace named testing

`terraform workspace select testing` - This will switch between workspaces

**6. Run terrafom plan**

`terraform plan -var-file="tfvars/YOURFILENAMEHERE.tfvars"` - This will generate execution plan

`terraform apply -var-file="tfvars/YOURFILENAMEHERE.tfvars"` - This will build the terraform resources

**6. Cleaning Up.**

`terraform state list` - This will list all terraform managed resources

`terraform destroy -var-file="tfvars/YOURFILENAMEHERE.tfvars"` - **This will destroy all Terraform-managed resource, be carefull when running this command.** If you encounter some errors try to verify if there are still resources left by re running `terraform state list` and run `terraform destroy -var-file="tfvars/YOURFILENAMEHERE.tfvars` again
