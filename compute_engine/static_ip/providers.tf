provider "google" {
  //project = "gentle-post-425320-d0"
  project     = var.gcloud_project
  region      = "us-west1"
  credentials = file("~/credentials/gcloud-default-tf-creds.json")
}
