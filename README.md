# terraform-k8s-base-config

[![open-issues](https://img.shields.io/github/issues-raw/shinyfoil/terraform-k8s-base-config?style=for-the-badge)](https://github.com/shinyfoil/terraform-k8s-base-config/issues)
[![open-pr](https://img.shields.io/github/issues-pr-raw/shinyfoil/terraform-k8s-base-config?style=for-the-badge)](https://github.com/shinyfoil/terraform-k8s-base-config/pulls)

## Features

This module...

## Terraform Versions

For Terraform v0.12.0+

## Usage

```hcl
module "this" {
  source = "github.com/shinyfoil/terraform-k8s-base-config"
}
```
## Examples

- [defaults](https://github.com/shinyfoil/terraform-k8s-base-config/tree/master/examples/defaults)

## Known  Issues
No issue is creating limit on this module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| helm | n/a |
| kubernetes | n/a |
| local | n/a |
| null | n/a |
| template | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| acme\_server | Full URI of the certificate issuing server | `string` | `"https://acme-staging-v02.api.letsencrypt.org/directory"` | no |
| all\_enabled | Bool to enable all services | `bool` | `true` | no |
| cert\_manager\_enabled | Bool to enable external cert-manager | `bool` | `true` | no |
| cert\_manager\_issuer\_secret\_name | k8s secret name for this issuer | `string` | `"letsencrypt-issuer-account-key"` | no |
| cloud\_platform | The cloud platform where the cluster is deployed | `string` | n/a | yes |
| consul\_enabled | Bool to enable consul | `bool` | `true` | no |
| issuer\_name | k8s resource name for your certificate issuer (e.g. letsencrypt) | `string` | `"letsencrypt"` | no |
| kubeconfig | The base64-encoded kubeconfig file contents for the cluster to apply CRDs to | `string` | `""` | no |
| region | The region where the cluster is deployed | `string` | n/a | yes |
| user\_email | Email address of user to be notifed by certificate issuer about expiry, etc. | `string` | `""` | no |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Testing
This module has been packaged with terratest tests

To run them:

1. Install Go
2. Run `make test-init` from the root of this repo
3. Run `make test` again from root

## Authors

Module managed by [shinyfoil](https://github.com/shinyfoil)

## Credits

- [Anton Babenko](https://github.com/antonbabenko)

## License

Apache 2 Licensed. See LICENSE for full details.