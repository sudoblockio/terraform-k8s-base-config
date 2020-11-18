
locals {
  cert_manager_enabled = var.all_enabled ? true : var.cert_manager_enabled
}

resource "random_pet" "cluster" {
  length = 2
}