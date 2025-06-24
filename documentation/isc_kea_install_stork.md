# isc_kea_install_stork

[Back to resource list](../README.md#resources)

## Actions

- `:install`
- `:delete`
- `:upgrade`
- `:remove`

## Properties

| Name                    | Name? | Type          | Default | Description                                                 | Allowed Values   |
| ----------------------- | ----- | ------------- | ------- | ----------------------------------------------------------- | ---------------- |
| `install_version`       |       | String        |         | Version of Stork to install                                 | stork, stork-dev |
| `repo_support_packages` |       | Array         |         |                                                             |                  |
| `packages`              |       | String, Array |         | Override the default installation packages for the platform |                  |
| `clear_default_config`  |       | true, false   |         | Clear default configuration on install                      |                  |
| `apt_repo_key_url`      |       | String        |         |                                                             |                  |

## Libraries

- `IscKea::Cookbook::InstallHelpers`
