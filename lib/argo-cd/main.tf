#----------------------
# main.tf
# - Planned Resources
#----------------------

#------------------------
# Planned Resources
# - resource blocks only
#------------------------
# ArgoCD instance
resource "helm_release" "argocd" {
  name       = var.name
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = var.resource_version
  namespace = var.namespace
  set {
    name  = "global.nodeSelector.nodepool"
    value = var.nodepool
  }
  set {
    name  = "global.podLabels.app"
    value = var.name
  }
  set {
    name  = "global.podLabels.version"
    value = var.resource_version
  }
}