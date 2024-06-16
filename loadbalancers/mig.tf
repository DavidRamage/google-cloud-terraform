resource "google_compute_region_instance_group_manager" "mig" {
  name   = "web-servers"
  region = "us-west1"
  version {
    instance_template = google_compute_instance_template.web_server.id
    name              = "primary"
  }
  base_instance_name = "web-server-vm"
  target_size        = 2
}
