# isc_kea_config_dhcp4

[Back to resource list](../README.md#resources)

## Uses

- [partial/isc_kea__config_auto_accumulator_kea](partial/isc_kea__config_auto_accumulator_kea.md)
- [partial/isc_kea__config_parameters_common](partial/isc_kea__config_parameters_common.md)

## Actions

- None

## Properties

| Name                             | Name? | Type           | Default | Description | Allowed Values                                |
| -------------------------------- | ----- | -------------- | ------- | ----------- | --------------------------------------------- |
| `authoritative`                  |       | true, false    |         |             |                                               |
| `boot_file_name`                 |       | String         |         |             |                                               |
| `cache_threshold`                |       | Integer        |         |             |                                               |
| `cache_max_age`                  |       | Integer        |         |             |                                               |
| `calculate_tee_times`            |       | String         |         |             |                                               |
| `ddns_generated_prefix`          |       | String         |         |             |                                               |
| `ddns_override_client_update`    |       | true, false    |         |             |                                               |
| `ddns_override_no_update`        |       | true, false    |         |             |                                               |
| `ddns_replace_client_name`       |       | String, Symbol |         |             | never, always, when-present, when-not-present |
| `ddns_qualifying_suffix`         |       | String         |         |             |                                               |
| `ddns_send_updates`              |       | true, false    |         |             |                                               |
| `ddns_update_on_renew`           |       | true, false    |         |             |                                               |
| `ddns_use_conflict_resolution`   |       | true, false    |         |             |                                               |
| `decline_probation_period`       |       | Integer        |         |             |                                               |
| `dhcp4o6_port`                   |       | Integer        |         |             |                                               |
| `echo_client_id`                 |       | true, false    |         |             |                                               |
| `host_reservation_identifiers`   |       | Array          |         |             |                                               |
| `hostname_char_set`              |       | String         |         |             |                                               |
| `hostname_char_replacement`      |       | String         |         |             |                                               |
| `ip_reservations_unique`         |       | true, false    |         |             |                                               |
| `match_client_id`                |       | true, false    |         |             |                                               |
| `min_preferred_lifetime`         |       | Integer        |         |             |                                               |
| `min_valid_lifetime`             |       | Integer        |         |             |                                               |
| `max_preferred_lifetime`         |       | Integer        |         |             |                                               |
| `max_valid_lifetime`             |       | Integer        |         |             |                                               |
| `next_server`                    |       | String         |         |             |                                               |
| `parked_packet_limit`            |       | Integer        |         |             |                                               |
| `rebind_timer`                   |       | Integer        |         |             |                                               |
| `renew_timer`                    |       | Integer        |         |             |                                               |
| `reservations_global`            |       | true, false    |         |             |                                               |
| `reservations_in_subnet`         |       | true, false    |         |             |                                               |
| `reservations_out_of_pool`       |       | true, false    |         |             |                                               |
| `server_hostname`                |       | String         |         |             |                                               |
| `server_tag`                     |       | String         |         |             |                                               |
| `statistic_default_sample_count` |       | Integer        |         |             |                                               |
| `statistic_default_sample_age`   |       | Integer        |         |             |                                               |
| `store_extended_info`            |       | true, false    |         |             |                                               |
| `t1_percent`                     |       | Integer, Float |         |             |                                               |
| `t2_percent`                     |       | Integer, Float |         |             |                                               |
| `valid_lifetime`                 |       | Integer        |         |             |                                               |
