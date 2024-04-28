output "server_external_ip" {
  description = "External IP address of the server"
  value       = hcloud_server.this.ipv4_address
}

output "connect_command" {
  description = "Command to connect to the server"
  value       = "ssh ${var.sudo_user}@${hcloud_server.this.ipv4_address} -i ~/.ssh/${var.pubkey}.pub"
}