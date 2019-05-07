terraform {
  backend "gcs" {
    bucket = "example-tf"
    credentials = "./gcloud-service-account.json"
    prefix = "your/path/here"
  }
}