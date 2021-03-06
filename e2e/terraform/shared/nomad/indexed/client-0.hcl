# Enable the client
client {
  enabled = true

  options {
    "driver.raw_exec.enable"    = "1"
    "docker.privileged.enabled" = "true"
  }

  meta {
    "rack" = "r1"
  }

  host_volume "shared_data" {
    path = "/tmp/data"
  }
}

plugin_dir = "/opt/nomad/plugins"
plugin "nomad-driver-podman" {
  config {
    volumes {
      enabled = true
    }
  }
}

vault {
  enabled = true
  address = "http://active.vault.service.consul:8200"
}
