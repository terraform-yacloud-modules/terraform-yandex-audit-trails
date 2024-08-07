output "id" {
  description = "ID of the created trail"
  value       = yandex_audit_trails_trail.basic_trail.id
}

output "name" {
  description = "Name of the created trail"
  value       = yandex_audit_trails_trail.basic_trail.name
}

output "folder_id" {
  description = "ID of the folder to which the trail belongs"
  value       = yandex_audit_trails_trail.basic_trail.folder_id
}

output "description" {
  description = "Description of the trail"
  value       = yandex_audit_trails_trail.basic_trail.description
}

output "labels" {
  description = "Labels defined by the user for the trail"
  value       = yandex_audit_trails_trail.basic_trail.labels
}

output "service_account_id" {
  description = "ID of the IAM service account that is used by the trail"
  value       = yandex_audit_trails_trail.basic_trail.service_account_id
}

output "log_group_id" {
  description = "ID of the log group where logs will be sent"
  value       = yandex_audit_trails_trail.basic_trail.logging_destination[0].log_group_id
}
