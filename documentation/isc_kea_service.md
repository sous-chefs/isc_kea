# isc_kea_service

[Back to resource list](../README.md#resources)

## Actions

- `:start`
- `:stop`
- `:restart`
- `:reload`
- `:enable`
- `:disable`

## Properties

| Name                      | Name? | Type        | Default | Description                                                      | Allowed Values                                                                                                                                |
| ------------------------- | ----- | ----------- | ------- | ---------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| `service_name`            | ✓     | String      |         |                                                                  | kea-ctrl-agent, isc-kea-ctrl-agent, kea-dhcp-ddns, isc-kea-dhcp-ddns-server, kea-dhcp4, isc-kea-dhcp4-server, kea-dhcp6, isc-kea-dhcp6-server |
| `config_file`             |       | String      |         |                                                                  |                                                                                                                                               |
| `config_test`             |       | true, false |         | Perform configuration file test before performing service action |                                                                                                                                               |
| `config_test_fail_action` |       | Symbol      |         | Action to perform upon configuration test failure.               | raise, log                                                                                                                                    |

## Libraries

- `IscKea::Cookbook::Helpers`
