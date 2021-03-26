
locals {
  cert_manager_enabled  = var.all_enabled ? true : var.cert_manager_enabled
  consul_enabled        = var.all_enabled ? true : var.consul_enabled
  external_dns_enabled  = var.all_enabled ? true : var.external_dns_enabled
  nginx_ingress_enabled = var.all_enabled ? true : var.nginx_ingress_enabled
}
