# isc_kea__config_auto_accumulator_kea

[Back to resource list](README.md#resources)

## Actions

- `:create`
- `:delete`

## Properties

| Name                        | Name? | Type        | Default | Description | Allowed Values |
| --------------------------- | ----- | ----------- | ------- | ----------- | -------------- |
| `sensitive`                 |       | true, false |         |             |                |
| `config_file`               |       | String      |         |             |                |
| `load_existing_config_file` |       | true, false |         |             |                |
| `cookbook`                  |       | String      |         |             |                |
| `source`                    |       | String      |         |             |                |
| `owner`                     |       | String      |         |             |                |
| `group`                     |       | String      |         |             |                |
| `filemode`                  |       | String      |         |             |                |
| `extra_options`             |       | Hash        |         |             |                |
| `force_replace`             |       | true, false |         |             |                |
| `clean_nil_values`          |       | true, false |         |             |                |

## Libraries

- `ChefAutoAccumulator`
- `IscKea::Cookbook::Helpers`
