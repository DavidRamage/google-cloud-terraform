resource "google_compute_instance_from_template" "templatized_instance" {
  name                     = "instance-from-template"
  zone                     = "us-west1-a"
  source_instance_template = google_compute_instance_template.web_server.self_link_unique
  tags                     = ["allow-http"]
}
