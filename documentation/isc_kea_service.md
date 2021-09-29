# isc_kea_service

[Back to resource list](../README.md#resources)

## Actions

- None

## Properties

| Name                      | Type        | Default | Description | Allowed Values                                                                                                                                                |
| ------------------------- | ----------- | ------- | ----------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `config_file`             | String      |         |             |                                                                                                                                                               |
| `config_test`             | true, false |         |             |                                                                                                                                                               |
| `config_test_fail_action` | Symbol      |         |             | `:raise`, `:log`                                                                                                                                              |
| `service_name`            | String      |         |             | `kea-ctrl-agent`, `isc-kea-ctrl-agent`, `kea-dhcp-ddns`, `isc-kea-dhcp-ddns-server`, `kea-dhcp4`, `isc-kea-dhcp4-server`, `kea-dhcp6`, `isc-kea-dhcp6-server` |
