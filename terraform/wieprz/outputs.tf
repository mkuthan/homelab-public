output "apt_cacher_ip" {
  value = split("/", module.apt-cacher.ip_address)[0]
}

