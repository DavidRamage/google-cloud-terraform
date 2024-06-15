provider "google" {
  project     = var.gcloud_project
  region      = "us-west1"
  credentials = file("~/credentials/gcloud-default-tf-creds.json")
}
