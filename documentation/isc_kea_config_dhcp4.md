# isc_kea_config_dhcp4

[Back to resource list](../README.md#resources)

## Actions

- None

## Properties

| Name                             | Type           | Default | Description | Allowed Values                                        |
| -------------------------------- | -------------- | ------- | ----------- | ----------------------------------------------------- |
| `authoritative`                  | true, false    |         |             |                                                       |
| `boot_file_name`                 | String         |         |             |                                                       |
| `cache_max_age`                  | Integer        |         |             |                                                       |
| `cache_threshold`                | Integer        |         |             |                                                       |
| `calculate_tee_times`            | String         |         |             |                                                       |
| `ddns_generated_prefix`          | String         |         |             |                                                       |
| `ddns_override_client_update`    | true, false    |         |             |                                                       |
| `ddns_override_no_update`        | true, false    |         |             |                                                       |
| `ddns_qualifying_suffix`         | String         |         |             |                                                       |
| `ddns_replace_client_name`       | String, Symbol |         |             | `never`, `always`, `when-present`, `when-not-present` |
| `ddns_send_updates`              | true, false    |         |             |                                                       |
| `ddns_update_on_renew`           | true, false    |         |             |                                                       |
| `ddns_use_conflict_resolution`   | true, false    |         |             |                                                       |
| `decline_probation_period`       | Integer        |         |             |                                                       |
| `echo_client_id`                 | true, false    |         |             |                                                       |
| `host_reservation_identifiers`   | Array          |         |             |                                                       |
| `hostname_char_replacement`      | String         |         |             |                                                       |
| `hostname_char_set`              | String         |         |             |                                                       |
| `ip_reservations_unique`         | true, false    |         |             |                                                       |
| `match_client_id`                | true, false    |         |             |                                                       |
| `max_preferred_lifetime`         | Integer        |         |             |                                                       |
| `max_valid_lifetime`             | Integer        |         |             |                                                       |
| `min_preferred_lifetime`         | Integer        |         |             |                                                       |
| `min_valid_lifetime`             | Integer        |         |             |                                                       |
| `next_server`                    | String         |         |             |                                                       |
| `parked_packet_limit`            | Integer        |         |             |                                                       |
| `rebind_timer`                   | Integer        |         |             |                                                       |
| `renew_timer`                    | Integer        |         |             |                                                       |
| `reservations_global`            | true, false    |         |             |                                                       |
| `reservations_in_subnet`         | true, false    |         |             |                                                       |
| `reservations_out_of_pool`       | true, false    |         |             |                                                       |
| `server_hostname`                | String         |         |             |                                                       |
| `server_tag`                     | String         |         |             |                                                       |
| `statistic_default_sample_age`   | Integer        |         |             |                                                       |
| `statistic_default_sample_count` | Integer        |         |             |                                                       |
| `store_extended_info`            | true, false    |         |             |                                                       |
| `valid_lifetime`                 | Integer        |         |             |                                                       |
