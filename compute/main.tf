locals {
  hostname = "local-vm"
  ip       = "127.0.0.1"
}

output "instance_hostname" {
  value = local.hostname
}

output "instance_ip" {
  value = local.ip
}
module "registry" {
  source = "./registry"
}

module "storage" {
  source      = "./storage"
  bucket_name = "app-bucket"
}

module "compute" {
  source = "./compute"
}

output "registry_url" {
  value = module.registry.registry_url
}

output "bucket_name" {
  value = module.storage.bucket_name
}

output "vm_ip" {
  value = module.compute.instance_ip
}
