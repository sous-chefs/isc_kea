# isc_kea__config_dhcp4_parameters_shared_network

[Back to resource list](../README.md#resources)

## Actions

- None

## Properties

| Name                           | Name? | Type           | Default | Description | Allowed Values                                |
| ------------------------------ | ----- | -------------- | ------- | ----------- | --------------------------------------------- |
| `authoritative`                |       | true, false    |         |             |                                               |
| `boot_file_name`               |       | String         |         |             |                                               |
| `cache_threshold`              |       | Integer        |         |             |                                               |
| `cache_max_age`                |       | Integer        |         |             |                                               |
| `calculate_tee_times`          |       | true, false    |         |             |                                               |
| `client_class`                 |       | String         |         |             |                                               |
| `ddns_generated_prefix`        |       | String         |         |             |                                               |
| `ddns_override_client_update`  |       | true, false    |         |             |                                               |
| `ddns_override_no_update`      |       | true, false    |         |             |                                               |
| `ddns_replace_client_name`     |       | String, Symbol |         |             | never, always, when-present, when-not-present |
| `ddns_qualifying_suffix`       |       | String         |         |             |                                               |
| `ddns_send_updates`            |       | true, false    |         |             |                                               |
| `ddns_update_on_renew`         |       | true, false    |         |             |                                               |
| `ddns_use_conflict_resolution` |       | true, false    |         |             |                                               |
| `hostname_char_set`            |       | String         |         |             |                                               |
| `hostname_char_replacement`    |       | String         |         |             |                                               |
| `interface`                    |       | String         |         |             |                                               |
| `match_client_id`              |       | true, false    |         |             |                                               |
| `min_valid_lifetime`           |       | Integer        |         |             |                                               |
| `max_valid_lifetime`           |       | Integer        |         |             |                                               |
| `next_server`                  |       | String         |         |             |                                               |
| `option_data`                  |       | Array          |         |             |                                               |
| `rebind_timer`                 |       | Integer        |         |             |                                               |
| `relay`                        |       | Hash           |         |             |                                               |
| `renew_timer`                  |       | Integer        |         |             |                                               |
| `reservations_global`          |       | true, false    |         |             |                                               |
| `reservations_in_subnet`       |       | true, false    |         |             |                                               |
| `reservations_out_of_pool`     |       | true, false    |         |             |                                               |
| `require_client_classes`       |       | Array          |         |             |                                               |
| `server_hostname`              |       | String         |         |             |                                               |
| `valid_lifetime`               |       | String         |         |             |                                               |
| `relay`                        |       | String         |         |             |                                               |
| `require_client_classes`       |       | String         |         |             |                                               |
| `server_hostname`              |       | String         |         |             |                                               |
| `store_extended_info`          |       | true, false    |         |             |                                               |
| `t1_percent`                   |       | Integer, Float |         |             |                                               |
| `t2_percent`                   |       | Integer, Float |         |             |                                               |
| `valid_lifetime`               |       | Integer        |         |             |                                               |
