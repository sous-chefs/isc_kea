# isc_kea__config_auto_accumulator

[Back to resource list](../README.md#resources)

## Actions

- `:create`
- `:delete`

## Properties

| Name                        | Type           | Default | Description | Allowed Values                    |
| --------------------------- | -------------- | ------- | ----------- | --------------------------------- |
| `config_file`               | String         |         |             |                                   |
| `cookbook`                  | String         |         |             |                                   |
| `extra_options`             | Hash           |         |             |                                   |
| `filemode`                  | String         |         |             |                                   |
| `filetype`                  | Symbol, String |         |             | `:json`, `:ini`, `:toml`, `:yaml` |
| `group`                     | String         |         |             |                                   |
| `load_existing_config_file` | true           |         |             |                                   |
| `owner`                     | String         |         |             |                                   |
| `sensitive`                 | true, false    |         |             |                                   |
| `source`                    | String         |         |             |                                   |
