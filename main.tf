resource "yandex_audit_trails_trail" "main" {
  name        = var.name
  folder_id   = var.folder_id
  description = var.description
  labels      = var.labels

  service_account_id = var.service_account_id

  dynamic "storage_destination" {
    for_each = var.storage_destination_bucket_name != null ? [1] : []
    content {
      bucket_name   = var.storage_destination_bucket_name
      object_prefix = var.storage_destination_bucket_name
    }
  }

  dynamic "logging_destination" {
    for_each = var.logging_destination_log_group_id != null ? [1] : []
    content {
      log_group_id = var.logging_destination_log_group_id
    }
  }

  dynamic "data_stream_destination" {
    for_each = var.data_stream_destination_database_id != null ? [1] : []
    content {
      database_id = var.data_stream_destination_database_id
      stream_name = var.data_stream_destination_stream_name
    }
  }

  #   resource-manager.folder
  # organization-manager.organization
  # resource-manager.cloud

  filtering_policy {
    dynamic "management_events_filter" {
      for_each = var.management_events_filters

      content {
        resource_scope {
          resource_id   = management_events_filter.value["resource_id"] != null ? management_events_filter.value["resource_id"] : (management_events_filter.value["resource_type"] == "resource-manager.folder" ? data.yandex_client_config.client.folder_id : (management_events_filter.value["resource_type"] == "resource-manager.cloud" ? data.yandex_client_config.client.cloud_id : null))
          resource_type = management_events_filter.value["resource_type"]
        }
      }
    }

    dynamic "data_events_filter" {
      for_each = var.data_events_filter
      content {
        service = data_events_filter.value["service"]
        resource_scope {
          resource_id   = data_events_filter.value["resource_id"] != null ? data_events_filter.value["resource_id"] : (data_events_filter.value["resource_type"] == "resource-manager.folder" ? data.yandex_client_config.client.folder_id : (data_events_filter.value["resource_type"] == "resource-manager.cloud" ? data.yandex_client_config.client.cloud_id : null))
          resource_type = data_events_filter.value["resource_type"]
        }
        included_events = data_events_filter.value["included_events"]
        excluded_events = data_events_filter.value["excluded_events"]
      }
    }
  }
}
