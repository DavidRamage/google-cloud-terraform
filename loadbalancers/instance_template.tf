resource "google_compute_instance_template" "web_server" {
  name         = "webserver-template"
  description  = "Template used to build a web server"
  machine_type = "e2-small"
  disk {
    source_image = "debian-cloud/debian-12"
    auto_delete  = true
    boot         = true
  }
  network_interface {
    network = "default"
    access_config {
      network_tier = "STANDARD"
    }
  }
  metadata_startup_script = file("metadata_script.sh")
}
