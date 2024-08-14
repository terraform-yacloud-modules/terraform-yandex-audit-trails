data "yandex_client_config" "client" {}

resource "yandex_audit_trails_trail" "basic_trail" {
  name        = var.trail_name
  folder_id   = data.yandex_client_config.client.folder_id
  description = var.trail_description

  labels = var.labels

  service_account_id = var.service_account_id

  dynamic "logging_destination" {
    for_each = var.enable_log_group_destination ? [1] : []
    content {
      log_group_id = var.log_group_name
    }
  }

  dynamic "storage_destination" {
    for_each = var.enable_bucket_destination ? [1] : []
    content {
      bucket_name   = var.bucket_name
      object_prefix = var.object_prefix
    }
  }

  filter {
    path_filter {
      any_filter {
        resource_id   = data.yandex_client_config.client.folder_id
        resource_type = "resource-manager.folder"
      }
    }
    event_filters {
      service = "storage"
      categories {
        plane = "DATA_PLANE"
        type  = "WRITE"
      }
      path_filter {
        any_filter {
          resource_id   = data.yandex_client_config.client.folder_id
          resource_type = "resource-manager.folder"
        }
      }
    }
  }
}
