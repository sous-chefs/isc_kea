# isc_kea_config_dhcp6_subnet_host_reservation_option_data

[Back to resource list](../README.md#resources)

## Uses

- [partial/_config_auto_accumulator_kea](partial/isc_kea__config_auto_accumulator_kea.md)
- [partial/_config_parameters_common](partial/isc_kea__config_parameters_common.md)

## Actions

- None

## Properties

| Name           | Name? | Type            | Default | Description | Allowed Values |
| -------------- | ----- | --------------- | ------- | ----------- | -------------- |
| `subnet`       |       | String          |         |             |                |
| `ip_addresses` |       | Array, String   |         |             |                |
| `option_name`  | ✓     | String          |         |             |                |
| `code`         |       | Integer         |         |             |                |
| `space`        |       | String          |         |             |                |
| `csv_format`   |       | true, false     |         |             |                |
| `data`         |       | String, Integer |         |             |                |
| `always_send`  |       | true, false     |         |             |                |