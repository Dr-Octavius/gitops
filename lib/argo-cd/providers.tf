#--------------
# providers.tf
#--------------

# Terraform Provider config (Compulsory)
# Ref: https://developer.hashicorp.com/terraform/language/terraform
terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "3.0.0-pre2"
    }
  }
}