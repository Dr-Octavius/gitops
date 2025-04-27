#----------------------
# main.tf
# - Local Expressions
# - Created Resources
# - Planned Resources
# - Referenced Configs
#----------------------

#----------------------
# Common Expressions
# - locals blocks only
#----------------------
locals {
  namespace = "gitops"
  nodepool  = "core-np"
}

#--------------------
# Created Resources
# - data blocks only
#--------------------
# Destination Cluster for Argo CD
data "digitalocean_kubernetes_cluster" "dev_cluster" {
  name = "sefire-sgp1-dev"
}

#------------------------
# Planned Resources
# - resource blocks only
#------------------------
# Destination namespace for GitOps
resource "kubernetes_namespace" "gitops" {
  metadata {
    name = local.namespace
  }
}

#----------------------
# Referenced Configs
# - module blocks only
#----------------------
# Module Config for ECK Operator
module "argo_cd" {
  source           = "modules/argo-cd" # where to reference module
  namespace        = local.namespace          # Set the target namespace to place pod in
  nodepool         = local.nodepool           # Set the target nodepool to place pod in
  name             = "argo-cd"           # Set the appropriate name
  resource_version = "7.8.28"                  # Set the appropriate version
}