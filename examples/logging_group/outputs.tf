output "id" {
  description = "ID of the created trail"
  value       = module.audit_trails.id
}

output "name" {
  description = "Name of the created trail"
  value       = module.audit_trails.name
}

output "folder_id" {
  description = "ID of the folder to which the trail belongs"
  value       = module.audit_trails.folder_id
}

output "description" {
  description = "Description of the trail"
  value       = module.audit_trails.description
}

output "labels" {
  description = "Labels defined by the user for the trail"
  value       = module.audit_trails.labels
}

output "service_account_id" {
  description = "ID of the IAM service account that is used by the trail"
  value       = module.audit_trails.service_account_id
}

output "log_group_id" {
  description = "ID of the log group where logs will be sent"
  value       = module.audit_trails.log_group_id
}
