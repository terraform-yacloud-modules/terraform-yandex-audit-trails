# Yandex Cloud <RESOURCE> Terraform module

Terraform module which creates Yandex Cloud <RESOURCE> resources.

## Examples

Examples codified under
the [`examples`](https://github.com/terraform-yacloud-modules/terraform-yandex-module-template/tree/main/examples) are intended
to give users references for how to use the module(s) as well as testing/validating changes to the source code of the
module. If contributing to the project, please be sure to make any appropriate updates to the relevant examples to allow
maintainers to test your changes and to keep the examples up to date for users. Thank you!

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
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
| [yandex_audit_trails_trail.basic_trail](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/audit_trails_trail) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_data_stream_destination"></a> [data\_stream\_destination](#input\_data\_stream\_destination) | Structure describing destination data stream of the trail | <pre>object({<br>    database_id = string<br>    stream_name = string<br>  })</pre> | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | Description of the trail | `string` | `null` | no |
| <a name="input_filter"></a> [filter](#input\_filter) | Structure describing event filtering process for the trail | <pre>object({<br>    path_filter = object({<br>      any_filter = object({<br>        resource_id   = string<br>        resource_type = string<br>      })<br>      some_filter = object({<br>        resource_id   = string<br>        resource_type = string<br>        any_filters = list(object({<br>          resource_id   = string<br>          resource_type = string<br>        }))<br>      })<br>    })<br>    event_filters = list(object({<br>      service = string<br>      categories = list(object({<br>        plane = string<br>        type  = string<br>      }))<br>      path_filter = object({<br>        any_filter = object({<br>          resource_id   = string<br>          resource_type = string<br>        })<br>        some_filter = object({<br>          resource_id   = string<br>          resource_type = string<br>          any_filters = list(object({<br>            resource_id   = string<br>            resource_type = string<br>          }))<br>        })<br>      })<br>    }))<br>  })</pre> | n/a | yes |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | ID of the folder to which the trail belongs | `string` | n/a | yes |
| <a name="input_labels"></a> [labels](#input\_labels) | Labels defined by the user | `map(string)` | `{}` | no |
| <a name="input_logging_destination"></a> [logging\_destination](#input\_logging\_destination) | Structure describing destination log group of the trail | <pre>object({<br>    log_group_id = string<br>  })</pre> | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the trail | `string` | n/a | yes |
| <a name="input_service_account_id"></a> [service\_account\_id](#input\_service\_account\_id) | ID of the IAM service account that is used by the trail | `string` | n/a | yes |
| <a name="input_storage_destination"></a> [storage\_destination](#input\_storage\_destination) | Structure describing destination bucket of the trail | <pre>object({<br>    bucket_name   = string<br>    object_prefix = string<br>  })</pre> | `null` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## License

Apache-2.0 Licensed.
See [LICENSE](https://github.com/terraform-yacloud-modules/terraform-yandex-module-template/blob/main/LICENSE).
