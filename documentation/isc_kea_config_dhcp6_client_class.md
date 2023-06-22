# isc_kea_config_dhcp6_client_class

[Back to resource list](README.md#resources)

## Uses

- [partial/isc_kea__config_auto_accumulator_kea](partial/isc_kea__config_auto_accumulator_kea.md)
- [partial/isc_kea__config_parameters_common](partial/isc_kea__config_parameters_common.md)

## Actions

- None

## Properties

| Name                     | Name? | Type        | Default | Description | Allowed Values |
| ------------------------ | ----- | ----------- | ------- | ----------- | -------------- |
| `class_name`             | ✓     | String      |         |             |                |
| `test`                   |       | String      |         |             |                |
| `option_def`             |       | Array, Hash |         |             |                |
| `option_data`            |       | Array, Hash |         |             |                |
| `valid_lifetime`         |       | Integer     |         |             |                |
| `min_valid_lifetime`     |       | Integer     |         |             |                |
| `max_valid_lifetime`     |       | Integer     |         |             |                |
| `preferred_lifetime`     |       | Integer     |         |             |                |
| `min_preferred_lifetime` |       | Integer     |         |             |                |
| `max_preferred_lifetime` |       | Integer     |         |             |                |
| `only_if_required`       |       | true, false |         |             |                |
