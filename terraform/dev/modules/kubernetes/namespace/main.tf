#----------------------
# main.tf
# - Planned Resources
#----------------------

#------------------------
# Planned Resources
# - resource blocks only
#------------------------
# Destination namespace for EFK stack
resource "kubernetes_namespace" "efk" {
  metadata {
    name = var.namespace
  }
}