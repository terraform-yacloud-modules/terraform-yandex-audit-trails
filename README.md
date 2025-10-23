# Yandex Cloud Audit Trails Terraform module

Terraform module which creates Yandex Cloud Audit Trails resources.

## Notes
Pay attention, that at one moment you can use only one destination: logging, storage or data_stream.

## Examples

Examples codified under
the [`examples`](https://github.com/terraform-yacloud-modules/terraform-yandex-module-template/tree/main/examples) are intended
to give users references for how to use the module(s) as well as testing/validating changes to the source code of the
module. If contributing to the project, please be sure to make any appropriate updates to the relevant examples to allow
maintainers to test your changes and to keep the examples up to date for users. Thank you!

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | >= 0.72.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | >= 0.72.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [yandex_audit_trails_trail.main](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/audit_trails_trail) | resource |
| [yandex_client_config.client](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_data_events_filter"></a> [data\_events\_filter](#input\_data\_events\_filter) | Data events list | <pre>list(object({<br/>    service         = string<br/>    resource_id     = optional(string, null)<br/>    resource_type   = string<br/>    included_events = optional(list(string), null)<br/>    excluded_events = optional(list(string), null)<br/>  }))</pre> | `[]` | no |
| <a name="input_data_stream_destination_database_id"></a> [data\_stream\_destination\_database\_id](#input\_data\_stream\_destination\_database\_id) | ID of the YDB hosting the destination data stream | `string` | `null` | no |
| <a name="input_data_stream_destination_stream_name"></a> [data\_stream\_destination\_stream\_name](#input\_data\_stream\_destination\_stream\_name) | Name of the YDS stream belonging to the specified YDB | `string` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | Description of the trail | `string` | `""` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | Folder ID | `string` | `null` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | A set of labels | `map(string)` | `{}` | no |
| <a name="input_logging_destination_log_group_id"></a> [logging\_destination\_log\_group\_id](#input\_logging\_destination\_log\_group\_id) | ID of the log group where logs will be sent | `string` | `null` | no |
| <a name="input_management_events_filters"></a> [management\_events\_filters](#input\_management\_events\_filters) | Management events list | <pre>list(object({<br/>    resource_id   = optional(string, null)<br/>    resource_type = string<br/>  }))</pre> | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | Trail name | `string` | n/a | yes |
| <a name="input_service_account_id"></a> [service\_account\_id](#input\_service\_account\_id) | ID of the IAM service account that is used by the trail | `string` | n/a | yes |
| <a name="input_storage_destination_bucket_name"></a> [storage\_destination\_bucket\_name](#input\_storage\_destination\_bucket\_name) | Name of the destination bucket | `string` | `null` | no |
| <a name="input_storage_destination_object_prefix"></a> [storage\_destination\_object\_prefix](#input\_storage\_destination\_object\_prefix) | Additional prefix of the uploaded objects. If not specified, objects will be uploaded with prefix equal to trail\_id | `string` | `null` | no |
| <a name="input_timeouts"></a> [timeouts](#input\_timeouts) | Timeout settings for cluster operations | <pre>object({<br/>    default = optional(string)<br/>  })</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | ID of the created trail |
| <a name="output_name"></a> [name](#output\_name) | Name of the created trail |
<!-- END_TF_DOCS -->

## License

Apache-2.0 Licensed.
See [LICENSE](https://github.com/terraform-yacloud-modules/terraform-yandex-module-template/blob/main/LICENSE).
