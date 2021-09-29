# isc_kea_config_dhcp6

[Back to resource list](../README.md#resources)

## Actions

- None

## Properties

| Name                             | Type           | Default | Description | Allowed Values                                        |
| -------------------------------- | -------------- | ------- | ----------- | ----------------------------------------------------- |
| `cache_max_age`                  | Integer        |         |             |                                                       |
| `cache_threshold`                | Integer        |         |             |                                                       |
| `calculate_tee_times`            | true, false    |         |             |                                                       |
| `data_directory`                 | String         |         |             |                                                       |
| `ddns_generated_prefix`          | String         |         |             |                                                       |
| `ddns_override_client_update`    | true, false    |         |             |                                                       |
| `ddns_override_no_update`        | true, false    |         |             |                                                       |
| `ddns_qualifying_suffix`         | String         |         |             |                                                       |
| `ddns_replace_client_name`       | String, Symbol |         |             | `never`, `always`, `when-present`, `when-not-present` |
| `ddns_send_updates`              | true, false    |         |             |                                                       |
| `ddns_update_on_renew`           | true, false    |         |             |                                                       |
| `ddns_use_conflict_resolution`   | true, false    |         |             |                                                       |
| `decline_probation_period`       | Integer        |         |             |                                                       |
| `host_reservation_identifiers`   | Array          |         |             |                                                       |
| `hostname_char_replacement`      | String         |         |             |                                                       |
| `hostname_char_set`              | String         |         |             |                                                       |
| `ip_reservations_unique`         | true, false    |         |             |                                                       |
| `mac_sources`                    | String, Array  |         |             |                                                       |
| `max_preferred_lifetime`         | Integer        |         |             |                                                       |
| `max_valid_lifetime`             | Integer        |         |             |                                                       |
| `min_preferred_lifetime`         | Integer        |         |             |                                                       |
| `min_valid_lifetime`             | Integer        |         |             |                                                       |
| `parked_packet_limit`            | Integer        |         |             |                                                       |
| `preferred_lifetime`             | Integer        |         |             |                                                       |
| `rapid_commit`                   | String         |         |             |                                                       |
| `rebind_timer`                   | Integer        |         |             |                                                       |
| `relay_supplied_options`         | String, Array  |         |             |                                                       |
| `renew_timer`                    | Integer        |         |             |                                                       |
| `reservations_global`            | true, false    |         |             |                                                       |
| `reservations_in_subnet`         | true, false    |         |             |                                                       |
| `reservations_out_of_pool`       | true, false    |         |             |                                                       |
| `server_tag`                     | String         |         |             |                                                       |
| `statistic_default_sample_age`   | Integer        |         |             |                                                       |
| `statistic_default_sample_count` | Integer        |         |             |                                                       |
| `store_extended_info`            | true, false    |         |             |                                                       |
| `valid_lifetime`                 | Integer        |         |             |                                                       |
