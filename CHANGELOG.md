# CHANGELOG for isc_kea

This file is used to list changes made in each version of isc_kea.

## Unreleased

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
