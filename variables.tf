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
  default     = "Some trail description"
}

variable "labels" {
  description = "Labels defined by the user"
  type        = map(string)
  default     = {
    key = "value"
  }
}

variable "service_account_id" {
  description = "ID of the IAM service account that is used by the trail"
  type        = string
}

variable "log_group_id" {
  description = "ID of the log group where logs will be sent"
  type        = string
}
