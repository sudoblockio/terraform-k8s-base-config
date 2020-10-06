# Enable flags
variable "all_enabled" {
  description = "Bool to enable all services"
  type        = bool
  default     = true
}

variable "cert_manager_enabled" {
  description = "Bool to enable external cert-manager"
  type        = bool
  default     = true
}

# Cert Manager
variable "issuer_name" {
  description = "k8s resource name for your certificate issuer (e.g. letsencrypt)"
  type        = string
  default     = "letsencrypt"
}

variable "user_email" {
  description = "Email address of user to be notifed by certificate issuer about expiry, etc."
  type        = string
  default     = ""
}

variable "acme_server" {
  description = "Full URI of the certificate issuing server"
  type        = string
  default     = "https://acme-staging-v02.api.letsencrypt.org/directory"
}

variable "cert_manager_issuer_secret_name" {
  description = "k8s secret name for this issuer"
  type        = string
  default     = "letsencrypt-issuer-account-key"
}


# Cluster
variable "kubeconfig" {
  description = "The base64-encoded kubeconfig file contents for the cluster to apply CRDs to"
  type        = string
  default     = ""
}