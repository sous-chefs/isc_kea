# isc_kea_config_dhcp6_ddns

[Back to resource list](../README.md#resources)

## Uses

- [partial/isc_kea__config_auto_accumulator_kea](partial/isc_kea__config_auto_accumulator_kea.md)
- [partial/isc_kea__config_parameters_common](partial/isc_kea__config_parameters_common.md)

## Actions

- None

## Properties

| Name             | Name? | Type           | Default | Description | Allowed Values |
| ---------------- | ----- | -------------- | ------- | ----------- | -------------- |
| `enable_updates` |       | true, false    |         |             |                |
| `max_queue_size` |       | Integer        |         |             |                |
| `ncr_protocol`   |       | String, Symbol |         |             | UDP            |
| `ncr_format`     |       | String, Symbol |         |             | JSON           |
| `sender_ip`      |       | String         |         |             |                |
| `sender_port`    |       | Integer        |         |             |                |
| `server_ip`      |       | String         |         |             |                |
| `server_port`    |       | Integer        |         |             |                |
