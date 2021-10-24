# isc_kea_config_dhcp_ddns_tsig_key

[Back to resource list](../README.md#resources)

## Uses

- [partial/_config_auto_accumulator_kea](partial/isc_kea__config_auto_accumulator_kea.md)
- [partial/_config_parameters_common](partial/isc_kea__config_parameters_common.md)

## Actions

- None

## Properties

| Name          | Name? | Type    | Default | Description | Allowed Values                                                          |
| ------------- | ----- | ------- | ------- | ----------- | ----------------------------------------------------------------------- |
| `key_name`    | ✓     | String  |         |             |                                                                         |
| `algorithm`   |       | String  |         |             | HMAC-MD5, HMAC-SHA1, HMAC-SHA224, HMAC-SHA256, HMAC-SHA386, HMAC-SHA512 |
| `digest_bits` |       | Integer |         |             |                                                                         |
| `secret`      |       | String  |         |             |                                                                         |
