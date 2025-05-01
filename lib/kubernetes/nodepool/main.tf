#----------------------
# main.tf
# - Planned Resources
#----------------------

#------------------------
# Planned Resources
# - resource blocks only
#------------------------
# Additional Kubernetes Node Pool
resource "digitalocean_kubernetes_node_pool" "np" {
  cluster_id = var.cluster_id
  name       = var.name
  size       = var.size
  auto_scale = var.auto_scale
  min_nodes  = var.min_nodes
  max_nodes  = var.max_nodes
  labels = {
    nodepool = var.name
  }
}