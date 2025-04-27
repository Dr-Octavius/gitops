#--------------
# variables.tf
#--------------

variable "namespace" {
  description = "Kubernetes namespace for ECK Operator"
  type        = string
}

variable "nodepool" {
  description = "Kubernetes nodepool for ECK Operator"
  type        = string
}

variable "name" {
  description = "Specific name for ECK Operator"
  type        = string
}

variable "resource_version" {
  description = "Specific version of ECK Operator"
  type        = string
}