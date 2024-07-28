variable "name" {
  description = "Name of the trail"
  type        = string
}

variable "folder_id" {
  description = "ID of the folder to which the trail belongs"
  type        = string
}

variable "description" {
  description = "Description of the trail"
  type        = string
  default     = null
}

variable "labels" {
  description = "Labels defined by the user"
  type        = map(string)
  default     = {}
}

variable "service_account_id" {
  description = "ID of the IAM service account that is used by the trail"
  type        = string
}

variable "logging_destination" {
  description = "Structure describing destination log group of the trail"
  type = object({
    log_group_id = string
  })
  default = null
}

variable "data_stream_destination" {
  description = "Structure describing destination data stream of the trail"
  type = object({
    database_id = string
    stream_name = string
  })
  default = null
}

variable "storage_destination" {
  description = "Structure describing destination bucket of the trail"
  type = object({
    bucket_name   = string
    object_prefix = string
  })
  default = null
}

variable "filter" {
  description = "Structure describing event filtering process for the trail"
  type = object({
    path_filter = object({
      any_filter = object({
        resource_id   = string
        resource_type = string
      })
      some_filter = object({
        resource_id   = string
        resource_type = string
        any_filters = list(object({
          resource_id   = string
          resource_type = string
        }))
      })
    })
    event_filters = list(object({
      service = string
      categories = list(object({
        plane = string
        type  = string
      }))
      path_filter = object({
        any_filter = object({
          resource_id   = string
          resource_type = string
        })
        some_filter = object({
          resource_id   = string
          resource_type = string
          any_filters = list(object({
            resource_id   = string
            resource_type = string
          }))
        })
      })
    }))
  })
}
