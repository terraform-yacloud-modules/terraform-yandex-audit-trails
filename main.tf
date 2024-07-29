resource "yandex_audit_trails_trail" "basic_trail" {
  name        = var.name
  folder_id   = var.folder_id
  description = var.description

  labels = var.labels

  service_account_id = var.service_account_id

  logging_destination {
    log_group_id = var.log_group_id
  }

  filter {
    path_filter {
      any_filter {
        resource_id   = var.folder_id
        resource_type = "resource-manager.folder"
      }
    }
  }
}
