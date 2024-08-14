variable "service_account_id" {
  type = string
}

variable "enable_log_group_destination" {
  description = "Enable log group destination for audit trail"
  type        = bool
  default     = false
}

variable "enable_bucket_destination" {
  description = "Enable bucket destination for audit trail"
  type        = bool
  default     = false
}

variable "log_group_name" {
  description = "Name of the log group"
  type        = string
  default     = "a-trail"
}

variable "bucket_name" {
  description = "Name of the storage bucket"
  type        = string
  default     = "audit-logs-bucket"
}

variable "trail_name" {
  description = "Name of the audit trail"
  type        = string
}

variable "trail_description" {
  description = "Description of the audit trail"
  type        = string
  default     = "Some trail description"
}

variable "labels" {
  description = "Labels for the audit trail"
  type        = map(string)
  default     = {}
}

variable "object_prefix" {
  description = "Prefix for the audit log objects in the bucket"
  type        = string
  default     = "audit-logs/"
}
