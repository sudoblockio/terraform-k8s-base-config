
data "template_file" "cert_manager" {
  count    = local.cert_manager_enabled ? 1 : 0
  template = yamlencode(yamldecode(file("${path.module}/cert_manager.yaml")))
  vars = {
  }
}

resource "helm_release" "cert_manager" {
  count      = local.cert_manager_enabled ? 1 : 0
  name       = "cert-manager"
  chart      = "cert-manager"
  repository = "https://charts.jetstack.io"
  namespace  = "cert-manager"

  values = [data.template_file.cert_manager[0].rendered]

  depends_on = [kubernetes_namespace.cert_manager]
}

resource "kubernetes_namespace" "cert_manager" {
  count = local.cert_manager_enabled ? 1 : 0
  metadata {
    name = "cert-manager"
  }
}

data "template_file" "issuer_crd" {
  count    = local.cert_manager_enabled ? 1 : 0
  template = yamlencode(yamldecode(file("${path.module}/cert_manager_issuer_crd.yaml")))
  vars = {
    issuer_name = var.issuer_name
    user_email  = var.user_email
    acme_server = var.acme_server
    secret_name = var.cert_manager_issuer_secret_name
  }
}

resource "local_file" "issuer_crd" {
  count             = local.cert_manager_enabled ? 1 : 0
  filename          = "${path.module}/issuer_crd.yaml"
  sensitive_content = data.template_file.issuer_crd[0].rendered
}

resource "null_resource" "cert_manager_apply_issuer_crd" {
  count = local.cert_manager_enabled ? 1 : 0
  provisioner "local-exec" {
    command = "kubectl apply -f ${local_file.issuer_crd[0].filename} --kubeconfig <(echo $KUBECONFIG | base64 --decode)"
    interpreter = [
      "/bin/bash",
    "-c"]
    environment = {
      KUBECONFIG = var.kubeconfig
    }
  }
  depends_on = [helm_release.cert_manager]
}