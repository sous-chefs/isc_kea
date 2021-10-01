# isc_kea__config_auto_accumulator

[Back to resource list](../README.md#resources)

## Actions

- `:create`
- `:delete`

## Properties

| Name                        | Name? | Type           | Default | Description | Allowed Values        |
| --------------------------- | ----- | -------------- | ------- | ----------- | --------------------- |
| `sensitive`                 |       | true, false    |         |             |                       |
| `config_file`               |       | String         |         |             |                       |
| `load_existing_config_file` |       | true           |         |             |                       |
| `cookbook`                  |       | String         |         |             |                       |
| `source`                    |       | String         |         |             |                       |
| `owner`                     |       | String         |         |             |                       |
| `group`                     |       | String         |         |             |                       |
| `filemode`                  |       | String         |         |             |                       |
| `filetype`                  |       | Symbol, String |         |             | json, ini, toml, yaml |
| `extra_options`             |       | Hash           |         |             |                       |

## Libraries

- `ChefAutoAccumulator::Resource`
- `IscKea::Cookbook::Helpers`
