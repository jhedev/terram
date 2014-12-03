variable "do_token" {}
variable "discovery_url" {}
variable "ssh_key" {}

variable "no_nodes" {
         default = 3
}

variable "do_region" {
        default = "ams3"
}

variable "droplet_size" {
         default = "1GB"
}
