output "ip_addresses" {
       value = "${digitalocean_droplet.node.0.ipv4_address}"
}