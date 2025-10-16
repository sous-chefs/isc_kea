# CHANGELOG for isc_kea

This file is used to list changes made in each version of isc_kea.

## [1.9.5](https://github.com/sous-chefs/isc_kea/compare/v1.9.4...v1.9.5) (2025-10-16)


### Bug Fixes

* **ci:** Update workflows to use release pipeline ([#47](https://github.com/sous-chefs/isc_kea/issues/47)) ([d11a3f3](https://github.com/sous-chefs/isc_kea/commit/d11a3f32391452e8d0050390afb3bfafa14ee998))

## [1.9.4](https://github.com/sous-chefs/isc_kea/compare/v1.9.3...v1.9.4) (2025-10-15)

### Bug Fixes

**cookstyle:** Run cookstyle on the codebase ([#45](https://github.com/sous-chefs/isc_kea/issues/45)) ([b3cc155](https://github.com/sous-chefs/isc_kea/commit/b3cc155ed91452e172d143525a7ba5b0e660c285))

## [1.9.3](https://github.com/sous-chefs/isc_kea/compare/1.9.2...v1.9.3) (2025-10-15)

### Bug Fixes

**ci:** Update workflows to use release pipeline ([#42](https://github.com/sous-chefs/isc_kea/issues/42)) ([08e67a7](https://github.com/sous-chefs/isc_kea/commit/08e67a79c72cbfcb9f878094ce58667ca02dfe65))

## 1.9.1 - *2025-07-07*

* Add `ddns`, `ddns-min` and `ddns-max` to relevant partial resources

## 1.9.0 - *2025-07-07*

* Add `ddns`, `ddns-min` and `ddns-max` to `config_dhcp4` and `config_dhcp6` resources

## 1.8.0 - *2025-07-06*

* Update cookbook for support of Kea version >= v2.7
  * `dev` repo install support
  * Resource client classification property changes for Kea 2.7
  * Multiple control socket support

## 1.7.3 - *2024-12-20*

* Remove `client_class` from match configuration for pools

## 1.7.1 - *2024-12-18*

* Correct property attributes for `config_match` used properties

## 1.7.0 - *2024-07-23*

* Add `stash-agent-option` property to `config_dhcp4`

## 1.6.0 - *2024-07-09*

* Add per-resource sorting for all array based configuration resources

## 1.5.0 - *2024-07-08*

* Add sort functions to `config_dhcp4_client_class` and `config_dhcp6_client_class`

## 1.4.4 - *2024-05-01*

* Resolved cookstyle error in `config_dhcp4_subnet_pool_option_data` resource
* Resolved cookstyle error in `config_dhcp6_subnet_pool_option_data` resource

## 1.4.0 - *2023-12-20*

* Add `ddns_conflict_resolution_mode` property for Kea 2.5

## 1.3.0 - *2023-12-19*

* Add Dhcp4/6 subnet pool option data resources

## 1.2.0 - *2023-10-16*

* Add `ddns-ttl-percent` option to all places it can be used

## 1.1.0 - *2023-07-12*

* Update installation packages to cover versions greater than 2.2
* Kitchen test with Kea 2.4
* Updates for Kea 2.4 release
  * Add `allocator` property to `config_dhcp4`
  * Add `allocator` and `pd_allocator` property to `config_dhcp6`
  * Add `template_test` property to `config_dhcp4_client_class` and `config_dhcp6_client_class`

## 1.0.1 - *2023-07-03*

* DHCP6 subnet preferred_lifetime should be an Integer

## 1.0.0 - *2023-06-24*

* Fix CI pipeline
* Initial release to supermarket

## 0.1.0 - *2022-01-04*

* Initial release
* Configuration of most Kea and Stork features
