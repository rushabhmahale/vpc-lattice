output "helm_release" {
  description = "Map of attributes of the Helm release created without sensitive outputs"
  value       = try({ for k, v in helm_release.helm_deployment : k => v if k != "repository_password" }, {})
}