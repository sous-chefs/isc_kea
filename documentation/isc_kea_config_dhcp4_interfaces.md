# isc_kea_config_dhcp4_interfaces

[Back to resource list](../README.md#resources)

## Uses

- [partial/isc_kea__config_auto_accumulator_kea](partial/isc_kea__config_auto_accumulator_kea.md)
- [partial/isc_kea__config_parameters_common](partial/isc_kea__config_parameters_common.md)

## Actions

- None

## Properties

| Name                 | Name? | Type           | Default | Description | Allowed Values               |
| -------------------- | ----- | -------------- | ------- | ----------- | ---------------------------- |
| `interfaces`         |       | String, Array  |         |             |                              |
| `dhcp_socket_type`   |       | String, Symbol |         |             | raw, udp                     |
| `outbound_interface` |       | String, Symbol |         |             | use-routing, same-as-inbound |
| `re_detect`          |       | true, false    |         |             |                              |
