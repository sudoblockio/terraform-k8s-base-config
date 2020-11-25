
data "template_file" "nginx_ingress" {
  template = file("${path.module}/nginx_ingress.yaml")
  vars = {
    cloud_platform = var.cloud_platform
  }
}


resource "helm_release" "nginx_ingress" {
  count      = local.nginx_ingress_enabled ? 1 : 0
  name       = "nginx-ingress"
  chart      = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx/"
  namespace  = "kube-system"

  values = [yamlencode(yamldecode(data.template_file.nginx_ingress.rendered))]
}