data "yandex_client_config" "client" {}

module "audit_trails_trail" {
  source = "../"

  name               = "minimal-trail"
  folder_id          = data.yandex_client_config.client.folder_id
  service_account_id = "your-service-account-id"

  logging_destination = {
    log_group_id = "your-log-group-id"
  }

  filter = {
    path_filter = {
      any_filter = {
        resource_id   = "your-folder-id"
        resource_type = "resource-manager.folder"
      }
    }
    event_filters = []
  }

}
