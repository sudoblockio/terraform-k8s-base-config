
data "template_file" "nginx_ingress" {
  template = yamlencode(yamldecode(file("${path.module}/nginx_ingress.yaml")))
}


resource "helm_release" "nginx_ingress" {
  count      = var.nginx_ingress_enabled ? 1 : 0
  name       = "nginx-ingress"
  chart      = "nginx-ingress"
  repository = "https://helm.nginx.com/stable"
  namespace  = "kube-system"

  values = [data.template_file.nginx_ingress.rendered]
}