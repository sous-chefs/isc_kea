# isc_kea__config_dhcp4_parameters_shared_network

[Back to resource list](../README.md#resources)

## Actions

- None

## Properties

| Name                           | Type           | Default | Description | Allowed Values                                        |
| ------------------------------ | -------------- | ------- | ----------- | ----------------------------------------------------- |
| `authoritative`                | true, false    |         |             |                                                       |
| `boot_file_name`               | String         |         |             |                                                       |
| `cache_max_age`                | Integer        |         |             |                                                       |
| `cache_threshold`              | Integer        |         |             |                                                       |
| `calculate_tee_times`          | String         |         |             |                                                       |
| `client_class`                 | String         |         |             |                                                       |
| `ddns_generated_prefix`        | String         |         |             |                                                       |
| `ddns_override_client_update`  | true, false    |         |             |                                                       |
| `ddns_override_no_update`      | true, false    |         |             |                                                       |
| `ddns_qualifying_suffix`       | String         |         |             |                                                       |
| `ddns_replace_client_name`     | String, Symbol |         |             | `never`, `always`, `when-present`, `when-not-present` |
| `ddns_send_updates`            | true, false    |         |             |                                                       |
| `ddns_update_on_renew`         | true, false    |         |             |                                                       |
| `ddns_use_conflict_resolution` | true, false    |         |             |                                                       |
| `hostname_char_replacement`    | String         |         |             |                                                       |
| `hostname_char_set`            | String         |         |             |                                                       |
| `interface`                    | String         |         |             |                                                       |
| `match_client_id`              | true, false    |         |             |                                                       |
| `max_valid_lifetime`           | Integer        |         |             |                                                       |
| `min_valid_lifetime`           | Integer        |         |             |                                                       |
| `next_server`                  | String         |         |             |                                                       |
| `option_data`                  | Array          |         |             |                                                       |
| `rebind_timer`                 | Integer        |         |             |                                                       |
| `relay`                        | Hash           |         |             |                                                       |
| `relay`                        | String         |         |             |                                                       |
| `renew_timer`                  | Integer        |         |             |                                                       |
| `require_client_classes`       | Array          |         |             |                                                       |
| `require_client_classes`       | String         |         |             |                                                       |
| `reservations_global`          | true, false    |         |             |                                                       |
| `reservations_in_subnet`       | true, false    |         |             |                                                       |
| `reservations_out_of_pool`     | true, false    |         |             |                                                       |
| `server_hostname`              | String         |         |             |                                                       |
| `server_hostname`              | String         |         |             |                                                       |
| `store_extended_info`          | true, false    |         |             |                                                       |
| `valid_lifetime`               | String         |         |             |                                                       |
| `valid_lifetime`               | Integer        |         |             |                                                       |
