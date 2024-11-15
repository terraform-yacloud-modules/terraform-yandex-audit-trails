module "iam_account" {
  source = "git::https://github.com/terraform-yacloud-modules/terraform-yandex-iam.git//modules/iam-account?ref=v1.0.0"

  name        = var.blank_name
  description = ""
  folder_id   = local.folder_id

  # NOTE: it's required to have such permissions,
  #       because we use resource-manager.folder type in Audit Trail
  folder_roles = [
    "admin",
    "logging.writer",
  ]

  # NOTE: it's required to have such permissions,
  #       because we use resource-manager.cloud type in Audit Trail
  cloud_roles = [
    "admin",
    "logging.writer",
  ]
  enable_static_access_key = true
  enable_api_key           = false
  enable_account_key       = false
}

module "logging_group" {
  source = "git::https://github.com/terraform-yacloud-modules/terraform-yandex-logging-group.git?ref=v1.0.0"

  name        = var.blank_name
  description = "Log group for Yandex Audit"
  folder_id   = local.folder_id
  labels      = {}

  retention_period = "3600s"
}

module "audit_trails" {
  source = "../../"

  name        = var.blank_name
  description = "Log group for Yandex Audit"
  folder_id   = local.folder_id
  labels      = {}

  service_account_id               = module.iam_account.id
  logging_destination_log_group_id = module.logging_group.id

  management_events_filters = [

    # This object will take the current user cloud, that is configured for TF provider
    {
      resource_type = "resource-manager.cloud"
    },

    # This object will take the provided organization ID
    {
      resource_id     = "<YOUR_ORG_ID>
      resource_type   = "organization-manager.organization"
    }
  ]

  data_events_filter = [

    # This object will take the current user cloud, that is configured for TF provider
    {
      service       = "storage"
      resource_type = "resource-manager.folder"
    },

    # This object will take the provided organization ID
    {
      service         = "compute"
      resource_id     = "<YOUR_ORG_ID>
      resource_type   = "organization-manager.organization"
      included_events = ["yandex.cloud.audit.compute.serialssh.ConnectSerialPort"]
    }
  ]

  depends_on = [
    module.iam_account,
    module.logging_group
  ]
}
