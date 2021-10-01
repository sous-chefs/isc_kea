# isc_kea_config_dhcp6_subnet

[Back to resource list](../README.md#resources)

## Uses

- [partial/_config_auto_accumulator](partial/isc_kea__config_auto_accumulator.md)
- [partial/_config_parameters_common](partial/isc_kea__config_parameters_common.md)
- [partial/_config_dhcp6_parameters_subnet](partial/isc_kea__config_dhcp6_parameters_subnet.md)

## Actions

- None

## Properties

| Name                     | Name? | Type        | Default | Description | Allowed Values |
| ------------------------ | ----- | ----------- | ------- | ----------- | -------------- |
| `id`                     |       | Integer     |         |             |                |
| `subnet`                 | ✓     | String      |         |             |                |
| `pd_pools`               |       | Array, Hash |         |             |                |
| `client_class`           |       | String      |         |             |                |
| `require_client_classes` |       | String      |         |             |                |
