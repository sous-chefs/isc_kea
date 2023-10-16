# isc_kea_config_dhcp6

[Back to resource list](README.md#resources)

## Uses

- [partial/isc_kea__config_auto_accumulator_kea](partial/isc_kea__config_auto_accumulator_kea.md)
- [partial/isc_kea__config_parameters_common](partial/isc_kea__config_parameters_common.md)

## Actions

- None

## Properties

| Name                             | Name? | Type                   | Default | Description | Allowed Values                                |
| -------------------------------- | ----- | ---------------------- | ------- | ----------- | --------------------------------------------- |
| `cache_threshold`                |       | Integer                |         |             |                                               |
| `cache_max_age`                  |       | Integer                |         |             |                                               |
| `calculate_tee_times`            |       | true, false            |         |             |                                               |
| `data_directory`                 |       | String                 |         |             |                                               |
| `ddns_generated_prefix`          |       | String                 |         |             |                                               |
| `ddns_override_client_update`    |       | true, false            |         |             |                                               |
| `ddns_override_no_update`        |       | true, false            |         |             |                                               |
| `ddns_replace_client_name`       |       | String, Symbol         |         |             | never, always, when-present, when-not-present |
| `ddns_qualifying_suffix`         |       | String                 |         |             |                                               |
| `ddns_send_updates`              |       | true, false            |         |             |                                               |
| `ddns_ttl_percent`               |       | Float, Integer, String |         |             |                                               |
| `ddns_update_on_renew`           |       | true, false            |         |             |                                               |
| `ddns_use_conflict_resolution`   |       | true, false            |         |             |                                               |
| `decline_probation_period`       |       | Integer                |         |             |                                               |
| `dhcp4o6_port`                   |       | Integer                |         |             |                                               |
| `host_reservation_identifiers`   |       | Array                  |         |             |                                               |
| `hostname_char_replacement`      |       | String                 |         |             |                                               |
| `hostname_char_set`              |       | String                 |         |             |                                               |
| `ip_reservations_unique`         |       | true, false            |         |             |                                               |
| `mac_sources`                    |       | String, Array          |         |             |                                               |
| `min_preferred_lifetime`         |       | Integer                |         |             |                                               |
| `min_valid_lifetime`             |       | Integer                |         |             |                                               |
| `max_preferred_lifetime`         |       | Integer                |         |             |                                               |
| `max_valid_lifetime`             |       | Integer                |         |             |                                               |
| `parked_packet_limit`            |       | Integer                |         |             |                                               |
| `preferred_lifetime`             |       | Integer                |         |             |                                               |
| `rapid_commit`                   |       | String                 |         |             |                                               |
| `rebind_timer`                   |       | Integer                |         |             |                                               |
| `relay_supplied_options`         |       | String, Array          |         |             |                                               |
| `renew_timer`                    |       | Integer                |         |             |                                               |
| `reservations_global`            |       | true, false            |         |             |                                               |
| `reservations_in_subnet`         |       | true, false            |         |             |                                               |
| `reservations_out_of_pool`       |       | true, false            |         |             |                                               |
| `server_tag`                     |       | String                 |         |             |                                               |
| `statistic_default_sample_count` |       | Integer                |         |             |                                               |
| `statistic_default_sample_age`   |       | Integer                |         |             |                                               |
| `store_extended_info`            |       | true, false            |         |             |                                               |
| `t1_percent`                     |       | Integer, Float         |         |             |                                               |
| `t2_percent`                     |       | Integer, Float         |         |             |                                               |
| `valid_lifetime`                 |       | Integer                |         |             |                                               |
