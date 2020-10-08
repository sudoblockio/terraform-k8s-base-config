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

variable "consul_enabled" {
  description = "Bool to enable consul"
  type        = bool
  default     = true
}

variable "external_dns_enabled" {
  description = "Bool to enable external DNS controller"
  type        = bool
  default     = true
}

variable "nginx_ingress_enabled" {
  description = "Bool to enable nginx ingress"
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

variable "region" {
  description = "The region where the cluster is deployed"
  type        = string
}

variable "cloud_platform" {
  description = "The cloud platform where the cluster is deployed"
  type        = string
}

variable "base_domain_name" {
  description = "The base domain name that will host the deployment. This can either be a root or a subdomain, but it should be the top-most domain to house resources."
  type        = string
  default     = ""
}

variable "azure_resource_group" {
  description = "The Azure resource group"
  type        = string
  default     = ""
}

variable "azure_service_principal_key" {
  description = "Contents of the JSON file for the Azure service principal"
  type        = string
  default     = ""
}

variable "google_project" {
  description = "Name of GCP project"
  type        = string
  default     = ""
}

variable "google_service_account_key" {
  description = "Contents of the JSON file for the GCP service account"
  type        = string
  default     = ""
}

variable "do_token" {
  description = "The DO API token"
  type        = string
  default     = ""
}

variable "aws_worker_arn" {
  description = "ARN for EKS worker nodes"
  type        = string
  default     = ""
}