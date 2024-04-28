variable "hcloud_token" {
  description = "Hetzner Cloud API token"
  sensitive   = true
}

variable "project_name" {
  description = "Name of the project"
}

variable "network_stage" {
  description = "Network stage"
  default     = "testnet"
}

variable "pubkey" {
  description = "Name of the public key file"
  default     = "id_rsa"
}

variable "sudo_user" {
  description = "Name of the sudo user"
}