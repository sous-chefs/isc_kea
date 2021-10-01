# isc_kea_config_dhcp6_subnet_option_data

[Back to resource list](../README.md#resources)

## Uses

- [partial/_config_auto_accumulator](partial/isc_kea__config_auto_accumulator.md)
- [partial/_config_parameters_common](partial/isc_kea__config_parameters_common.md)

## Actions

- None

## Properties

| Name          | Name? | Type            | Default | Description | Allowed Values |
| ------------- | ----- | --------------- | ------- | ----------- | -------------- |
| `subnet`      |       | String          |         |             |                |
| `option_name` | ✓     | String          |         |             |                |
| `code`        |       | Integer         |         |             |                |
| `type`        |       | String          |         |             |                |
| `space`       |       | String          |         |             |                |
| `csv_format`  |       | true, false     |         |             |                |
| `data`        |       | String, Integer |         |             |                |
| `always_send` |       | true, false     |         |             |                |
