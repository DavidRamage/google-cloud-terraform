resource "google_compute_network" "ilb_network" {
  name                    = "ilb-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "proxy_subnet" {
  name          = "ilb-proxy-subnet"
  ip_cidr_range = "10.0.0.0/24"
  region        = "us-west1"
  purpose       = "REGIONAL_MANAGED_PROXY"
  role          = "ACTIVE"
  network       = google_compute_network.ilb_network.id
}

resource "google_compute_subnetwork" "ilb_subnet" {
  name          = "ilb-subnet"
  ip_cidr_range = "10.0.1.0/24"
  region        = "us-west1"
  network       = google_compute_network.ilb_network.id
}
