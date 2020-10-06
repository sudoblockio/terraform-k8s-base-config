
locals {
  cert_manager_enabled = var.all_enabled ? true : var.cert_manager_enabled
}

data "helm_repository" "jetstack" {
  name = "jetstack"
  url  = "https://charts.jetstack.io"
}