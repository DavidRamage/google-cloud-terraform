data "google_compute_instance" "webserver" {
  name = "web-server"
  zone = "us-west1-a"
}

resource "google_compute_image" "webserver_image" {
  name        = "web-server-image"
  source_disk = data.google_compute_instance.webserver.boot_disk[0].source
}
