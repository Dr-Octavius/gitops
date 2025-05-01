#------------
# outputs.tf
#------------

output "elasticsearch_endpoint" {
  description = "Elasticsearch endpoint"
  value       = "http://elasticsearch-master:9200"
}

output "kibana_endpoint" {
  description = "Kibana endpoint"
  value       = "http://kibana-kibana:5601"
}

output "namespace" {
  description = "Kubernetes namespace where the EFK stack is deployed"
  value       = kubernetes_namespace.efk.metadata[0].name
}

output "access_kibana_command" {
  description = "Command to access Kibana via port-forwarding"
  value       = "kubectl port-forward svc/kibana-kibana 5601:5601 -n ${kubernetes_namespace.efk.metadata[0].name}"
}

output "view_elasticsearch_logs_command" {
  description = "Command to view Elasticsearch logs"
  value       = "kubectl logs -f -l app=elasticsearch-master -n ${kubernetes_namespace.efk.metadata[0].name}"
}

output "view_kibana_logs_command" {
  description = "Command to view Kibana logs"
  value       = "kubectl logs -f -l app=kibana -n ${kubernetes_namespace.efk.metadata[0].name}"
}

output "view_fluentbit_logs_command" {
  description = "Command to view Fluent Bit logs"
  value       = "kubectl logs -f -l app=fluent-bit -n ${kubernetes_namespace.efk.metadata[0].name}"
}