data "template_file" "consul" {
  template = yamlencode(yamldecode(file("${path.module}/consul.yaml")))
  vars = {
    region = var.region
    domain = var.base_domain_name
  }
}

resource "helm_release" "consul" {
  count      = local.consul_enabled ? 1 : 0
  name       = "consul"
  chart      = "consul"
  repository = "https://helm.releases.hashicorp.com"
  namespace  = "kube-system"

  values = [data.template_file.consul.rendered]
}

resource "null_resource" "kube_dns_stub" {
  count = var.cloud_platform == "gcp" && local.consul_enabled ? 1 : 0
  provisioner "local-exec" {
    command = "${path.module}/scripts/create_consul_stub_gcp.sh"
    interpreter = [
      "/bin/bash",
    "-c"]
    environment = {
      KUBECONFIG = var.kubeconfig
      MODPATH    = path.module
    }
  }
  depends_on = [helm_release.consul]
}

resource "null_resource" "core_dns_stub" {
  count = var.cloud_platform == "aws" && local.consul_enabled ? 1 : 0
  provisioner "local-exec" {
    command = "${path.module}/scripts/create_consul_stub_coredns.sh"
    interpreter = [
      "/bin/bash",
    "-c"]
    environment = {
      KUBECONFIG = var.kubeconfig
      MODPATH    = path.module
    }
  }
  depends_on = [helm_release.consul]
}

resource "null_resource" "core_dns_azure_stub" {
  count = var.cloud_platform == "azure" && local.consul_enabled ? 1 : 0
  provisioner "local-exec" {
    command = "${path.module}/scripts/create_consul_stub_azure.sh"
    interpreter = [
      "/bin/bash",
    "-c"]
    environment = {
      KUBECONFIG = var.kubeconfig
      MODPATH    = path.module
    }
  }
  depends_on = [helm_release.consul]
}