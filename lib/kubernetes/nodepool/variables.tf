#--------------
# variables.tf
#--------------

variable "cluster_id" {
  description = "Cluster ID of Destination Kubernetes Cluster"
  type        = string
  sensitive   = true
}

variable "name" {
  description = "Nodepool Name"
  type        = string
}

# Ref: https://docs.digitalocean.com/products/kubernetes/details/limits/#allocatable-memory
variable "size" {
  description = "Nodepool Size"
  type        = string
}

variable "auto_scale" {
  description = "Enable Nodepool Autoscaling"
  type        = bool
}

variable "min_nodes" {
  description = "Minimum Number of Nodes in Nodepool"
  type        = number
}

variable "max_nodes" {
  description = "Maximum Number of Nodes in Nodepool"
  type        = number
}