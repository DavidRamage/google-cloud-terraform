resource "google_compute_region_health_check" "default" {
  name   = "ilb-hc"
  region = "us-west1"
  http_health_check {
    port_specification = "USE_SERVING_PORT"
  }
}

resource "google_compute_region_backend_service" "default" {
  name                  = "ilb-backend-subnet"
  region                = "us-west1"
  protocol              = "HTTP"
  load_balancing_scheme = "INTERNAL_MANAGED"
  timeout_sec           = 10
  health_checks         = [google_compute_region_health_check.default.id]
  backend {
    group           = google_compute_region_instance_group_manager.mig.instance_group
    balancing_mode  = "UTILIZATION"
    capacity_scaler = 1.0
  }
}

resource "google_compute_region_url_map" "default" {
  name            = "ilb-regional-url-map"
  region          = "us-west1"
  default_service = google_compute_region_backend_service.default.id
}

resource "google_compute_region_target_http_proxy" "default" {
  name    = "ilb-target-http-proxy"
  region  = "us-west1"
  url_map = google_compute_region_url_map.default.id
}
