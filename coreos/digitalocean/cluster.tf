provider "digitalocean" {
    token = "${var.do_token}"
}

# Cluster nodes
resource "digitalocean_droplet" "node" {
   image = "coreos-stable"
   name = "node-${count.index}"
   region = "${var.do_region}"
   size = "${var.droplet_size}"
   private_networking = true
   ssh_keys = ["${var.ssh_key}"]
   count = "${var.no_nodes}"
   user_data = "#cloud-config\n\ncoreos:\n  etcd:\n    discovery: ${var.discovery_url}\n    addr: $private_ipv4:4001\n    peer-addr: $private_ipv4:7001\n  fleet:\n    public-ip: $private_ipv4\n  units:\n    - name: etcd.service\n      command: start\n    - name: fleet.service\n      command: start"
}
