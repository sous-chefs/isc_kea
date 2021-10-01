# isc_kea_install

[Back to resource list](../README.md#resources)

## Actions

- `:install`
- `:delete`
- `:upgrade`
- `:remove`

## Properties

| Name                    | Name? | Type          | Default | Description | Allowed Values |
| ----------------------- | ----- | ------------- | ------- | ----------- | -------------- |
| `install_version`       |       | String        |         |             |                |
| `repo_support_packages` |       | Array         |         |             |                |
| `packages`              |       | String, Array |         |             |                |
| `clear_default_config`  |       | true, false   |         |             |                |
| `apt_repo_key_url`      |       | String        |         |             |                |

## Libraries

- `IscKea::Cookbook::InstallHelpers`
