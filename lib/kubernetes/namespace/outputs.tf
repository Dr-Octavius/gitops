#------------
# outputs.tf
#------------

output "namespace" {
  description = "The name of the created kubernetes namespace"
  value = kubernetes_namespace.efk.metadata.name
}