
data "template_file" "external_dns" {
  template = yamlencode(yamldecode(file("${path.module}/external_dns.yaml")))
  vars = {
    domain               = var.base_domain_name
    region               = var.cloud_platform == "aws" ? var.region : ""
    zone_type            = var.cloud_platform == "aws" ? "public" : ""
    provider             = var.cloud_platform == "gcp" ? "google" : var.cloud_platform == "do" ? "digitalocean" : var.cloud_platform
    google_project       = var.cloud_platform == "gcp" ? var.google_project : ""
    azure_resource_group = var.cloud_platform == "azure" ? var.azure_resource_group : ""
    do_token             = var.cloud_platform == "do" ? var.do_token : ""
    aws_policy           = var.cloud_platform == "aws" ? aws_iam_role.external_dns[0].arn : ""
  }
}

resource "helm_release" "external_dns" {
  count      = local.external_dns_enabled ? 1 : 0
  name       = "external-dns"
  chart      = "external-dns"
  repository = "https://charts.bitnami.com/bitnami"
  namespace  = "kube-system"

  values = [data.template_file.external_dns.rendered]
}