#--------------
# variables.tf
#--------------

# All secrets must be passed via variable
# Ref: https://developer.hashicorp.com/terraform/tutorials/configuration-language/sensitive-variables
variable "do_token" {
  description = "Digital Ocean API token"
  type        = string
  sensitive   = true
}