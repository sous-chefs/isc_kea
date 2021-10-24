# isc_kea_config_dhcp6_subnet_pd_pool

[Back to resource list](../README.md#resources)

## Uses

- [partial/_config_auto_accumulator_kea](partial/isc_kea__config_auto_accumulator_kea.md)
- [partial/_config_parameters_common](partial/isc_kea__config_parameters_common.md)
- [partial/_config_dhcp6_parameters_pool](partial/isc_kea__config_dhcp6_parameters_pool.md)

## Actions

- None

## Properties

| Name                     | Name? | Type    | Default | Description | Allowed Values |
| ------------------------ | ----- | ------- | ------- | ----------- | -------------- |
| `subnet`                 |       | String  |         |             |                |
| `prefix`                 | ✓     | String  |         |             |                |
| `prefix_len`             |       | Integer |         |             |                |
| `client_class`           |       | String  |         |             |                |
| `delegated_len`          |       | Integer |         |             |                |
| `excluded_prefix`        |       | String  |         |             |                |
| `excluded_prefix_len`    |       | Integer |         |             |                |
| `option_data`            |       | Array   |         |             |                |
| `require_client_classes` |       | Array   |         |             |                |
