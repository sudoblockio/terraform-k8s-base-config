# terraform-k8s-base-config

[![open-issues](https://img.shields.io/github/issues-raw/insight-infrastructure/terraform-k8s-base-config?style=for-the-badge)](https://github.com/shinyfoil/terraform-k8s-base-config/issues)
[![open-pr](https://img.shields.io/github/issues-pr-raw/insight-infrastructure/terraform-k8s-base-config?style=for-the-badge)](https://github.com/shinyfoil/terraform-k8s-base-config/pulls)

## Features

This module...

## Terraform Versions

For Terraform v0.12.0+

## Usage

```hcl
module "this" {
  source = "github.com/insight-infrastructure/terraform-k8s-base-config"
}
```
## Examples

- [defaults](https://github.com/insight-infrastructure/terraform-k8s-base-config/tree/master/examples/defaults)

## Known  Issues
No issue is creating limit on this module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |
| <a name="provider_local"></a> [local](#provider\_local) | n/a |
| <a name="provider_null"></a> [null](#provider\_null) | n/a |
| <a name="provider_template"></a> [template](#provider\_template) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.dns_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.external_dns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.external_dns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [helm_release.cert_manager](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.consul](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.external_dns](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.nginx_ingress](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_namespace.cert_manager](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_secret.azure_credentials](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [kubernetes_secret.gcp_credentials](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [local_file.issuer_crd](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [null_resource.cert_manager_apply_issuer_crd](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.core_dns_azure_stub](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.core_dns_stub](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.kube_dns_stub](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [aws_iam_policy_document.assume](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.dns_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [template_file.cert_manager](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.consul](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.external_dns](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.issuer_crd](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.nginx_ingress](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acme_server"></a> [acme\_server](#input\_acme\_server) | Full URI of the certificate issuing server | `string` | `"https://acme-v02.api.letsencrypt.org/directory"` | no |
| <a name="input_all_enabled"></a> [all\_enabled](#input\_all\_enabled) | Bool to enable all services | `bool` | `true` | no |
| <a name="input_aws_worker_arn"></a> [aws\_worker\_arn](#input\_aws\_worker\_arn) | ARN for EKS worker nodes - blank for non-aws. | `string` | `""` | no |
| <a name="input_azure_resource_group"></a> [azure\_resource\_group](#input\_azure\_resource\_group) | The Azure resource group | `string` | `""` | no |
| <a name="input_azure_service_principal_key"></a> [azure\_service\_principal\_key](#input\_azure\_service\_principal\_key) | Contents of the JSON file for the Azure service principal | `string` | `""` | no |
| <a name="input_base_domain_name"></a> [base\_domain\_name](#input\_base\_domain\_name) | The base domain name that will host the deployment. This can either be a root or a subdomain, but it should be the top-most domain to house resources. | `string` | n/a | yes |
| <a name="input_cert_manager_enabled"></a> [cert\_manager\_enabled](#input\_cert\_manager\_enabled) | Bool to enable external cert-manager | `bool` | `true` | no |
| <a name="input_cert_manager_issuer_secret_name"></a> [cert\_manager\_issuer\_secret\_name](#input\_cert\_manager\_issuer\_secret\_name) | k8s secret name for this issuer | `string` | `"letsencrypt-issuer-account-key"` | no |
| <a name="input_cloud_platform"></a> [cloud\_platform](#input\_cloud\_platform) | The cloud platform where the cluster is deployed | `string` | n/a | yes |
| <a name="input_consul_enabled"></a> [consul\_enabled](#input\_consul\_enabled) | Bool to enable consul | `bool` | `true` | no |
| <a name="input_do_token"></a> [do\_token](#input\_do\_token) | The DO API token | `string` | `""` | no |
| <a name="input_external_dns_enabled"></a> [external\_dns\_enabled](#input\_external\_dns\_enabled) | Bool to enable external DNS controller | `bool` | `true` | no |
| <a name="input_google_project"></a> [google\_project](#input\_google\_project) | Name of GCP project | `string` | `""` | no |
| <a name="input_google_service_account_key"></a> [google\_service\_account\_key](#input\_google\_service\_account\_key) | Contents of the JSON file for the GCP service account | `string` | `""` | no |
| <a name="input_issuer_name"></a> [issuer\_name](#input\_issuer\_name) | k8s resource name for your certificate issuer (e.g. letsencrypt) | `string` | `"letsencrypt"` | no |
| <a name="input_kubeconfig"></a> [kubeconfig](#input\_kubeconfig) | The base64-encoded kubeconfig file contents for the cluster to apply CRDs to | `string` | n/a | yes |
| <a name="input_nginx_ingress_enabled"></a> [nginx\_ingress\_enabled](#input\_nginx\_ingress\_enabled) | Bool to enable nginx ingress | `bool` | `true` | no |
| <a name="input_region"></a> [region](#input\_region) | The region where the cluster is deployed | `string` | n/a | yes |
| <a name="input_user_email"></a> [user\_email](#input\_user\_email) | Email address of user to be notifed by certificate issuer about expiry, etc. | `string` | `""` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Testing
This module has been packaged with terratest tests

To run them:

1. Install Go
2. Run `make test-init` from the root of this repo
3. Run `make test` again from root

## Authors

Module managed by [Richard Mah](https://github.com/shinyfoil)

## Credits

- [Anton Babenko](https://github.com/antonbabenko)

## License

Apache 2 Licensed. See LICENSE for full details.