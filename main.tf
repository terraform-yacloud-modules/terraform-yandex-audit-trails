resource "yandex_audit_trails_trail" "basic_trail" {
  name        = var.name
  folder_id   = var.folder_id
  description = var.description

  labels = var.labels

  service_account_id = var.service_account_id

  dynamic "logging_destination" {
    for_each = var.logging_destination != null ? [var.logging_destination] : []
    content {
      log_group_id = logging_destination.value.log_group_id
    }
  }

  dynamic "data_stream_destination" {
    for_each = var.data_stream_destination != null ? [var.data_stream_destination] : []
    content {
      database_id = data_stream_destination.value.database_id
      stream_name = data_stream_destination.value.stream_name
    }
  }

  dynamic "storage_destination" {
    for_each = var.storage_destination != null ? [var.storage_destination] : []
    content {
      bucket_name   = storage_destination.value.bucket_name
      object_prefix = storage_destination.value.object_prefix
    }
  }

  filter {
    dynamic "path_filter" {
      for_each = var.filter.path_filter != null ? [var.filter.path_filter] : []
      content {
        dynamic "any_filter" {
          for_each = path_filter.value.any_filter != null ? [path_filter.value.any_filter] : []
          content {
            resource_id   = any_filter.value.resource_id
            resource_type = any_filter.value.resource_type
          }
        }
        dynamic "some_filter" {
          for_each = path_filter.value.some_filter != null ? [path_filter.value.some_filter] : []
          content {
            resource_id   = some_filter.value.resource_id
            resource_type = some_filter.value.resource_type
            any_filters {
              for_each = some_filter.value.any_filters
              content {
                resource_id   = any_filters.value.resource_id
                resource_type = any_filters.value.resource_type
              }
            }
          }
        }
      }
    }

    dynamic "event_filters" {
      for_each = var.filter.event_filters
      content {
        service = event_filters.value.service
        categories {
          for_each = event_filters.value.categories
          content {
            plane = categories.value.plane
            type  = categories.value.type
          }
        }
        dynamic "path_filter" {
          for_each = event_filters.value.path_filter != null ? [event_filters.value.path_filter] : []
          content {
            dynamic "any_filter" {
              for_each = path_filter.value.any_filter != null ? [path_filter.value.any_filter] : []
              content {
                resource_id   = any_filter.value.resource_id
                resource_type = any_filter.value.resource_type
              }
            }
            dynamic "some_filter" {
              for_each = path_filter.value.some_filter != null ? [path_filter.value.some_filter] : []
              content {
                resource_id   = some_filter.value.resource_id
                resource_type = some_filter.value.resource_type
                any_filters {
                  for_each = some_filter.value.any_filters
                  content {
                    resource_id   = any_filters.value.resource_id
                    resource_type = any_filters.value.resource_type
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}
