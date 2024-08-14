data "yandex_client_config" "client" {}

module "iam_accounts" {
  source = "git::https://github.com/terraform-yacloud-modules/terraform-yandex-iam.git//modules/iam-account?ref=v1.0.0"

  name = "iam"
  folder_roles = [
    "admin",
  ]
  cloud_roles              = []
  enable_static_access_key = false
  enable_api_key           = false
  enable_account_key       = false

}

module "logging_group" {
  source = "git::https://github.com/terraform-yacloud-modules/terraform-yandex-logging-group.git"

  name             = "test-logging-group"
  folder_id        = data.yandex_client_config.client.folder_id
  retention_period = "3600s" # 1 hour
  description      = "Example log group description"
  labels = {
    environment = "production"
  }
}

module "audit_trails" {
  source = "../../"

  service_account_id         = module.iam_accounts.id
  enable_log_group_destination = true
  enable_bucket_destination   = false
  log_group_name              = module.logging_group.id
  trail_name                  = "a-trail"
  trail_description           = "Some trail description"
  labels                      = {
    key = "value"
  }

  depends_on = [module.iam_accounts, module.logging_group]
}
