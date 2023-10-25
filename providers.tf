# TERRAFORM VERSION
terraform {
  required_version = ">= 0.12"
}
# AWS PROVIDERS
provider "aws" {
  region     = var.region #La region la tomo de mi archivo.tfvars
  access_key = var.access_key
  secret_key = var.secret_key

  default_tags {
    tags = local.tags
  }
}