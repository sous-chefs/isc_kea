# isc_kea_config_dhcp4_shared_network_subnet

[Back to resource list](../README.md#resources)

## Uses

- [partial/_config_auto_accumulator_kea](partial/isc_kea__config_auto_accumulator_kea.md)
- [partial/_config_parameters_common](partial/isc_kea__config_parameters_common.md)
- [partial/_config_dhcp4_parameters_subnet](partial/isc_kea__config_dhcp4_parameters_subnet.md)

## Actions

- None

## Properties

| Name                  | Name? | Type        | Default | Description | Allowed Values |
| --------------------- | ----- | ----------- | ------- | ----------- | -------------- |
| `shared_network_name` |       | String      |         |             |                |
| `id`                  |       | Integer     |         |             |                |
| `subnet`              | ✓     | String      |         |             |                |
| `pools`               |       | Array, Hash |         |             |                |
| `option_data`         |       | Array, Hash |         |             |                |
