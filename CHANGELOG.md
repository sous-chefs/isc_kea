# CHANGELOG for isc_kea

This file is used to list changes made in each version of isc_kea.

## Unreleased

## 1.7.2 - *2024-12-20*

## 1.7.1 - *2024-12-18*

- Correct property attributes for `config_match` used properties

## 1.7.0 - *2024-07-23*

- Add `stash-agent-option` property to `config_dhcp4`

## 1.6.0 - *2024-07-09*

- Add per-resource sorting for all array based configuration resources

## 1.5.0 - *2024-07-08*

- Add sort functions to `config_dhcp4_client_class` and `config_dhcp6_client_class`

## 1.4.4 - *2024-05-01*

- resolved cookstyle error: resources/config_dhcp4_subnet_pool_option_data.rb:56:11 refactor: `Chef/RedundantCode/UnnecessaryDesiredState`
- resolved cookstyle error: resources/config_dhcp6_subnet_pool_option_data.rb:56:11 refactor: `Chef/RedundantCode/UnnecessaryDesiredState`

## 1.4.3 - *2024-05-01*

## 1.4.2 - *2024-05-01*

## 1.4.1 - *2023-12-21*

## 1.4.0 - *2023-12-20*

- Add `ddns_conflict_resolution_mode` property for Kea 2.5

## 1.3.0 - *2023-12-19*

- Add Dhcp4/6 subnet pool option data resources

## 1.2.0 - *2023-10-16*

- Add `ddns-ttl-percent` option to all places it can be used

## 1.1.0 - *2023-07-12*

- Update installation packages to cover versions greater than 2.2
- Kitchen test with Kea 2.4
- Updates for Kea 2.4 release
  - Add `allocator` property to `config_dhcp4`
  - Add `allocator` and `pd_allocator` property to `config_dhcp6`
  - Add `template_test` property to `config_dhcp4_client_class` and `config_dhcp6_client_class`

## 1.0.2 - *2023-07-12*

## 1.0.1 - *2023-07-03*

- DHCP6 subnet preferred_lifetime should be an Integer

## 1.0.0 - *2023-06-24*

- Fix CI pipeline
- Initial release to supermarket

## 0.1.0 (2022-01-04)

- Initial release
- Configuration of most Kea and Stork features
