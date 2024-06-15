resource "google_compute_firewall" "allow_http" {
  name    = "allow-http-rule"
  network = "default"
  allow {
    ports    = ["80"]
    protocol = "tcp"
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["allow-http"]
  priority      = 1000
}
