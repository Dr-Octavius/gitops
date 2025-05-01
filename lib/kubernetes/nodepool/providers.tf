#--------------
# providers.tf
#--------------

# Terraform Provider config (Compulsory)
# Ref: https://developer.hashicorp.com/terraform/language/terraform
terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.50.0"
    }
  }
}