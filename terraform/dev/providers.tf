#--------------
# providers.tf
#--------------

# Terraform Provider config (Compulsory)
# Ref: https://developer.hashicorp.com/terraform/language/terraform
terraform {
  cloud {
    organization = "sefire"
    workspaces {
      name = "gitops-sgp1-dev"
    }
  }
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.50.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.36.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "3.0.0-pre2"
    }
  }
}

# Digital Ocean Provider config
# Ref: https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs
provider "digitalocean" {
  token = var.do_token
}

# Helm Charts Provider config
# Ref: https://registry.terraform.io/providers/hashicorp/helm/latest/docs
provider "helm" {
  kubernetes {
    host  = data.digitalocean_kubernetes_cluster.dev_cluster.endpoint
    token = data.digitalocean_kubernetes_cluster.dev_cluster.kube_config.0.token
    cluster_ca_certificate = base64decode(
      data.digitalocean_kubernetes_cluster.dev_cluster.kube_config.0.cluster_ca_certificate
    )
  }
}

# Kubernetes Provider config
# Ref: https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs
provider "kubernetes" {
  host  = data.digitalocean_kubernetes_cluster.dev_cluster.endpoint
  token = data.digitalocean_kubernetes_cluster.dev_cluster.kube_config.0.token
  cluster_ca_certificate = base64decode(
    data.digitalocean_kubernetes_cluster.dev_cluster.kube_config.0.cluster_ca_certificate
  )
}