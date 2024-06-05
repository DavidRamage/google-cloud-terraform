resource "google_compute_instance" "web_server" {
  name         = "web-server"
  machine_type = "e2-small"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }
  network_interface {
    network = "default"
    access_config {
      network_tier = "PREMIUM"
      nat_ip       = google_compute_address.static.address
    }
  }
  metadata_startup_script = file("metadata_script.sh")
  zone                    = "us-west1-a"
  tags                    = ["allow-http"]
}
