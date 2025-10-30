################################################################################
# yandex cloud
################################################################################
variable "folder_id" {
  description = "Folder ID"
  type        = string
  default     = null
}

################################################################################
# Naming
################################################################################
variable "name" {
  description = "Trail name"
  type        = string
}

variable "description" {
  description = "Description of the trail"
  type        = string
  default     = ""
}

variable "labels" {
  description = "A set of labels"
  type        = map(string)
  default     = {}
}

################################################################################
# Other parameters
################################################################################
variable "service_account_id" {
  description = "ID of the IAM service account that is used by the trail"
  type        = string
}

variable "storage_destination_bucket_name" {
  description = "Name of the destination bucket"
  type        = string
  default     = null
}

variable "logging_destination_log_group_id" {
  description = "ID of the log group where logs will be sent"
  type        = string
  default     = null
}

variable "data_stream_destination_database_id" {
  description = "ID of the YDB hosting the destination data stream"
  type        = string
  default     = null
}

variable "data_stream_destination_stream_name" {
  description = "Name of the YDS stream belonging to the specified YDB"
  type        = string
  default     = null
}

variable "management_events_filters" {
  description = "Management events list"
  type = list(object({
    resource_id   = optional(string, null)
    resource_type = string
  }))
  default = []
}

variable "data_events_filter" {
  description = "Data events list"
  type = list(object({
    service         = string
    resource_id     = optional(string, null)
    resource_type   = string
    included_events = optional(list(string), null)
    excluded_events = optional(list(string), null)
  }))
  default = []
}

variable "timeouts" {
  description = "Timeout settings for cluster operations"
  type = object({
    default = optional(string)
  })
  default = null
}
