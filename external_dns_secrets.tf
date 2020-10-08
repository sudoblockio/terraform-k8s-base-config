
resource "kubernetes_secret" "gcp_credentials" {
  count = var.cloud_platform == "gcp" ? 1 : 0
  metadata {
    name      = "gcp-credentials"
    namespace = "kube-system"
  }

  data = {
    credentials = var.google_service_account_key
  }
}

resource "kubernetes_secret" "azure_credentials" {
  count = var.cloud_platform == "azure" ? 1 : 0
  metadata {
    name      = "azure-credentials"
    namespace = "kube-system"
  }

  data = {
    "azure.json" = var.azure_service_principal_key
  }
}
