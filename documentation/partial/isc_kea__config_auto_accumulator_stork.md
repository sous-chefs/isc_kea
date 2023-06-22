# isc_kea__config_auto_accumulator_stork

[Back to resource list](README.md#resources)

## Actions

- `:create`
- `:delete`

## Properties

| Name                        | Name? | Type        | Default | Description | Allowed Values |
| --------------------------- | ----- | ----------- | ------- | ----------- | -------------- |
| `sensitive`                 |       | true, false |         |             |                |
| `config_file`               |       | String      |         |             |                |
| `load_existing_config_file` |       | true        |         |             |                |
| `cookbook`                  |       | String      |         |             |                |
| `source`                    |       | String      |         |             |                |
| `owner`                     |       | String      |         |             |                |
| `group`                     |       | String      |         |             |                |
| `filemode`                  |       | String      |         |             |                |
| `extra_options`             |       | Hash        |         |             |                |

## Libraries

- `ChefAutoAccumulator`
- `IscKea::Cookbook::Helpers`
