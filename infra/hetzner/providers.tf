terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~>1.46"
    }
    cloudinit = {
      source = "hashicorp/cloudinit"
      version = "~>2.3.4"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}