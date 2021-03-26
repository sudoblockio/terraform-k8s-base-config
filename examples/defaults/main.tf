variable "aws_region" {
  default = "us-east-1"
}

provider "aws" {
  region = var.aws_region
}

data "aws_region" "this" {}

module "cluster" {
  source = "github.com/geometry-labs/terraform-aws-k8s-cluster-priv.git//examples/defaults?ref=dev"
}

module "defaults" {
  source           = "../.."
  cloud_platform   = "aws"
  region           = data.aws_region.this.name
  user_email       = "testing@geometry-ci.net"
  base_domain_name = "geometry-ci.net"

  kubeconfig     = base64encode(module.cluster.kubeconfig)
  aws_worker_arn = module.cluster.aws_worker_arn
}
