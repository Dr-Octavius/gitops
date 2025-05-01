#--------------
# providers.tf
#--------------

# Terraform Provider config (Compulsory)
# Ref: https://developer.hashicorp.com/terraform/language/terraform
terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.36.0"
    }
  }
}