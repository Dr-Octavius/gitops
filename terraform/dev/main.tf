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
  namespace = "argocd" # MUTATION REQUIRES CHANGING NAMESPACES IN INSTALL.YAML
}

#--------------------
# Created Resources
# - data blocks only
#--------------------
# Destination Cluster for Argo CD
data "digitalocean_kubernetes_cluster" "dev_cluster" {
  name = "sefire-sgp1-dev"
}

#--------------------------------------------------------
# Planned Resources
# - resource blocks only
# - place here if speed is prioritised; modularise later
#--------------------------------------------------------

#----------------------
# Referenced Configs
# - module blocks only
#----------------------
# Module Config for argocd namespace
module "namespace" {
  source    = "./modules/kubernetes/namespace" # where to reference module
  namespace = local.namespace                  # Set the target namespace to be created
}