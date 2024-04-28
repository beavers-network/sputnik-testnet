resource "hcloud_placement_group" "this" {
  name = var.project_name
  type = "spread"
  labels = {
    creator = "terraform"
    project = var.project_name
    network = var.network_stage
  }
}

resource "hcloud_network" "this" {
  name     = "${var.project_name}-${var.network_stage}"
  ip_range = "10.0.0.0/16"
}

resource "hcloud_network_subnet" "this" {
  type         = "cloud"
  network_id   = hcloud_network.this.id
  network_zone = "eu-central"
  ip_range     = "10.0.10.0/24"
}

resource "hcloud_ssh_key" "this" {
  name       = "terraform"
  public_key = file("~/.ssh/${var.pubkey}.pub")
}

resource "hcloud_server" "this" {
  name               = "${var.project_name}-${var.network_stage}-server"
  placement_group_id = hcloud_placement_group.this.id
  server_type        = "cpx21"
  location           = "nbg1"
  image              = "ubuntu-24.04"
  ssh_keys           = [hcloud_ssh_key.this.id]
  user_data          = data.cloudinit_config.init.rendered
  public_net {
    ipv6_enabled = false
  }
  network {
    network_id = hcloud_network.this.id
    ip = "10.0.10.20"
    alias_ips = []
  }
  labels = {
    creator = "terraform"
    project = var.project_name
    network = var.network_stage
  }
}

data "cloudinit_config" "init" {
  gzip          = false
  base64_encode = false

  part {
    filename     = "cloud-config.yaml"
    content_type = "text/cloud-config"
    content = templatefile("./init/userdata.tftpl", {
      sudo_user = var.sudo_user,
      ssh_key  = hcloud_ssh_key.this.public_key
    })
  }
}
