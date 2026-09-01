variable "blank_name" {
  type    = string
  default = "terraform-yandex-audit-trails-example-3"
}

variable "folder_id" {
  description = "ID каталога Yandex Cloud, в котором создаются ресурсы. Имеет приоритет над YC_FOLDER_ID."
  type        = string
  default     = null
}
