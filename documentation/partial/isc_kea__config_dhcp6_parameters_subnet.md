# isc_kea__config_dhcp6_parameters_subnet

[Back to resource list](README.md#resources)

## Actions

- None

## Properties

| Name                           | Name? | Type           | Default | Description | Allowed Values                                |
| ------------------------------ | ----- | -------------- | ------- | ----------- | --------------------------------------------- |
| `cache_threshold`              |       | Integer, Float |         |             |                                               |
| `cache_max_age`                |       | Integer, Float |         |             |                                               |
| `client_class`                 |       | String         |         |             |                                               |
| `ddns_generated_prefix`        |       | String         |         |             |                                               |
| `ddns_override_client_update`  |       | true, false    |         |             |                                               |
| `ddns_override_no_update`      |       | true, false    |         |             |                                               |
| `ddns_replace_client_name`     |       | String, Symbol |         |             | never, always, when-present, when-not-present |
| `ddns_qualifying_suffix`       |       | String         |         |             |                                               |
| `ddns_send_updates`            |       | true, false    |         |             |                                               |
| `ddns_update_on_renew`         |       | true, false    |         |             |                                               |
| `ddns_use_conflict_resolution` |       | true, false    |         |             |                                               |
| `hostname_char_replacement`    |       | String         |         |             |                                               |
| `hostname_char_set`            |       | String         |         |             |                                               |
| `interface`                    |       | String         |         |             |                                               |
| `interface_id`                 |       | String         |         |             |                                               |
| `min_preferred_lifetime`       |       | Integer        |         |             |                                               |
| `min_valid_lifetime`           |       | Integer        |         |             |                                               |
| `max_preferred_lifetime`       |       | Integer        |         |             |                                               |
| `max_valid_lifetime`           |       | Integer        |         |             |                                               |
| `preferred_lifetime`           |       | Integer        |         |             |                                               |
| `rapid_commit`                 |       | true, false    |         |             |                                               |
| `rebind_timer`                 |       | Integer        |         |             |                                               |
| `relay`                        |       | Hash           |         |             |                                               |
| `renew_timer`                  |       | Integer        |         |             |                                               |
| `require_client_classes`       |       | Array          |         |             |                                               |
| `reservations_global`          |       | true, false    |         |             |                                               |
| `reservations_in_subnet`       |       | true, false    |         |             |                                               |
| `reservations_out_of_pool`     |       | true, false    |         |             |                                               |
| `store_extended_info`          |       | true, false    |         |             |                                               |
| `t1_percent`                   |       | Integer, Float |         |             |                                               |
| `t2_percent`                   |       | Integer, Float |         |             |                                               |
| `valid_lifetime`               |       | Integer        |         |             |                                               |
