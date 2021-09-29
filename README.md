# isc_kea

Provides a set of resources to install and configure ISC Kea

## Maintainers

This cookbook is maintained by the Sous Chefs. The Sous Chefs are a community of Chef cookbook maintainers working together to maintain important cookbooks. If you’d like to know more please visit [sous-chefs.org](https://sous-chefs.org/) or come chat with us on the Chef Community Slack in [#sous-chefs](https://chefcommunity.slack.com/messages/C2V7B88SF).

## Change Log

- See [CHANGELOG.md](/CHANGELOG.md) for version details and changes.

## Requirements

### Cookbooks

- `yum-epel` for RHEL/CentOS/Amazon

### Platforms

The following platforms are supported and tested with Test Kitchen:

- RHEL/CentOS 7+
- Ubuntu 18.04+
- Debian 9+

## Resources

### Partials

- [isc_kea__config_auto_accumulator](documentation/partial/isc_kea__config_auto_accumulator.md)
- [isc_kea__config_database](documentation/partial/isc_kea__config_database.md)
- [isc_kea__config_dhcp4_parameters_pool](documentation/partial/isc_kea__config_dhcp4_parameters_pool.md)
- [isc_kea__config_dhcp4_parameters_shared_network](documentation/partial/isc_kea__config_dhcp4_parameters_shared_network.md)
- [isc_kea__config_dhcp4_parameters_subnet](documentation/partial/isc_kea__config_dhcp4_parameters_subnet.md)
- [isc_kea__config_dhcp6_parameters_pd_pool](documentation/partial/isc_kea__config_dhcp6_parameters_pd_pool.md)
- [isc_kea__config_dhcp6_parameters_pool](documentation/partial/isc_kea__config_dhcp6_parameters_pool.md)
- [isc_kea__config_dhcp6_parameters_shared_network](documentation/partial/isc_kea__config_dhcp6_parameters_shared_network.md)
- [isc_kea__config_dhcp6_parameters_subnet](documentation/partial/isc_kea__config_dhcp6_parameters_subnet.md)
- [isc_kea__config_parameters_common](documentation/partial/isc_kea__config_parameters_common.md)

Note: All resources get their actions and base properties from the partial [_config_auto_accumulator](documentation/partial/isc_kea__config_auto_accumulator.md)

- [isc_kea_config_ctrl_agent](documentation/isc_kea_config_ctrl_agent.md)
- [isc_kea_config_ctrl_agent_authentication](documentation/isc_kea_config_ctrl_agent_authentication.md)
- [isc_kea_config_ctrl_agent_authentication_client](documentation/isc_kea_config_ctrl_agent_authentication_client.md)
- [isc_kea_config_ctrl_agent_control_socket](documentation/isc_kea_config_ctrl_agent_control_socket.md)
- [isc_kea_config_ctrl_agent_hooks_library](documentation/isc_kea_config_ctrl_agent_hooks_library.md)
- [isc_kea_config_ctrl_agent_loggers](documentation/isc_kea_config_ctrl_agent_loggers.md)
- [isc_kea_config_ctrl_agent_loggers_output](documentation/isc_kea_config_ctrl_agent_loggers_output.md)
- [isc_kea_config_dhcp4](documentation/isc_kea_config_dhcp4.md)
- [isc_kea_config_dhcp4_client_class](documentation/isc_kea_config_dhcp4_client_class.md)
- [isc_kea_config_dhcp4_compatibility](documentation/isc_kea_config_dhcp4_compatibility.md)
- [isc_kea_config_dhcp4_config_control](documentation/isc_kea_config_dhcp4_config_control.md)
- [isc_kea_config_dhcp4_config_control_database](documentation/isc_kea_config_dhcp4_config_control_database.md)
- [isc_kea_config_dhcp4_control_socket](documentation/isc_kea_config_dhcp4_control_socket.md)
- [isc_kea_config_dhcp4_ddns](documentation/isc_kea_config_dhcp4_ddns.md)
- [isc_kea_config_dhcp4_expired_leases_processing](documentation/isc_kea_config_dhcp4_expired_leases_processing.md)
- [isc_kea_config_dhcp4_global_host_reservation](documentation/isc_kea_config_dhcp4_global_host_reservation.md)
- [isc_kea_config_dhcp4_hooks_library](documentation/isc_kea_config_dhcp4_hooks_library.md)
- [isc_kea_config_dhcp4_hosts_database](documentation/isc_kea_config_dhcp4_hosts_database.md)
- [isc_kea_config_dhcp4_interfaces](documentation/isc_kea_config_dhcp4_interfaces.md)
- [isc_kea_config_dhcp4_lease_database](documentation/isc_kea_config_dhcp4_lease_database.md)
- [isc_kea_config_dhcp4_loggers](documentation/isc_kea_config_dhcp4_loggers.md)
- [isc_kea_config_dhcp4_loggers_output](documentation/isc_kea_config_dhcp4_loggers_output.md)
- [isc_kea_config_dhcp4_multi_threading](documentation/isc_kea_config_dhcp4_multi_threading.md)
- [isc_kea_config_dhcp4_option_data](documentation/isc_kea_config_dhcp4_option_data.md)
- [isc_kea_config_dhcp4_option_def](documentation/isc_kea_config_dhcp4_option_def.md)
- [isc_kea_config_dhcp4_queue_control](documentation/isc_kea_config_dhcp4_queue_control.md)
- [isc_kea_config_dhcp4_sanity_checks](documentation/isc_kea_config_dhcp4_sanity_checks.md)
- [isc_kea_config_dhcp4_shared_network](documentation/isc_kea_config_dhcp4_shared_network.md)
- [isc_kea_config_dhcp4_shared_network_option_data](documentation/isc_kea_config_dhcp4_shared_network_option_data.md)
- [isc_kea_config_dhcp4_shared_network_subnet](documentation/isc_kea_config_dhcp4_shared_network_subnet.md)
- [isc_kea_config_dhcp4_subnet](documentation/isc_kea_config_dhcp4_subnet.md)
- [isc_kea_config_dhcp4_subnet_host_reservation](documentation/isc_kea_config_dhcp4_subnet_host_reservation.md)
- [isc_kea_config_dhcp4_subnet_option_data](documentation/isc_kea_config_dhcp4_subnet_option_data.md)
- [isc_kea_config_dhcp4_subnet_pool](documentation/isc_kea_config_dhcp4_subnet_pool.md)
- [isc_kea_config_dhcp6](documentation/isc_kea_config_dhcp6.md)
- [isc_kea_config_dhcp6_client_class](documentation/isc_kea_config_dhcp6_client_class.md)
- [isc_kea_config_dhcp6_compatibility](documentation/isc_kea_config_dhcp6_compatibility.md)
- [isc_kea_config_dhcp6_config_control](documentation/isc_kea_config_dhcp6_config_control.md)
- [isc_kea_config_dhcp6_config_control_config_database](documentation/isc_kea_config_dhcp6_config_control_config_database.md)
- [isc_kea_config_dhcp6_control_socket](documentation/isc_kea_config_dhcp6_control_socket.md)
- [isc_kea_config_dhcp6_ddns](documentation/isc_kea_config_dhcp6_ddns.md)
- [isc_kea_config_dhcp6_expired_leases_processing](documentation/isc_kea_config_dhcp6_expired_leases_processing.md)
- [isc_kea_config_dhcp6_global_host_reservation](documentation/isc_kea_config_dhcp6_global_host_reservation.md)
- [isc_kea_config_dhcp6_hooks_library](documentation/isc_kea_config_dhcp6_hooks_library.md)
- [isc_kea_config_dhcp6_hosts_database](documentation/isc_kea_config_dhcp6_hosts_database.md)
- [isc_kea_config_dhcp6_interfaces](documentation/isc_kea_config_dhcp6_interfaces.md)
- [isc_kea_config_dhcp6_lease_database](documentation/isc_kea_config_dhcp6_lease_database.md)
- [isc_kea_config_dhcp6_loggers](documentation/isc_kea_config_dhcp6_loggers.md)
- [isc_kea_config_dhcp6_loggers_output](documentation/isc_kea_config_dhcp6_loggers_output.md)
- [isc_kea_config_dhcp6_multi_threading](documentation/isc_kea_config_dhcp6_multi_threading.md)
- [isc_kea_config_dhcp6_option_data](documentation/isc_kea_config_dhcp6_option_data.md)
- [isc_kea_config_dhcp6_option_def](documentation/isc_kea_config_dhcp6_option_def.md)
- [isc_kea_config_dhcp6_queue_control](documentation/isc_kea_config_dhcp6_queue_control.md)
- [isc_kea_config_dhcp6_sanity_checks](documentation/isc_kea_config_dhcp6_sanity_checks.md)
- [isc_kea_config_dhcp6_server_id](documentation/isc_kea_config_dhcp6_server_id.md)
- [isc_kea_config_dhcp6_shared_network](documentation/isc_kea_config_dhcp6_shared_network.md)
- [isc_kea_config_dhcp6_shared_network_option_data](documentation/isc_kea_config_dhcp6_shared_network_option_data.md)
- [isc_kea_config_dhcp6_shared_network_subnet](documentation/isc_kea_config_dhcp6_shared_network_subnet.md)
- [isc_kea_config_dhcp6_subnet](documentation/isc_kea_config_dhcp6_subnet.md)
- [isc_kea_config_dhcp6_subnet_host_reservation](documentation/isc_kea_config_dhcp6_subnet_host_reservation.md)
- [isc_kea_config_dhcp6_subnet_option_data](documentation/isc_kea_config_dhcp6_subnet_option_data.md)
- [isc_kea_config_dhcp6_subnet_pd_pool](documentation/isc_kea_config_dhcp6_subnet_pd_pool.md)
- [isc_kea_config_dhcp6_subnet_pool](documentation/isc_kea_config_dhcp6_subnet_pool.md)
- [isc_kea_config_dhcp6_subnet_prefix_delegation](documentation/isc_kea_config_dhcp6_subnet_prefix_delegation.md)
- [isc_kea_config_dhcp_ddns](documentation/isc_kea_config_dhcp_ddns.md)
- [isc_kea_config_dhcp_ddns_control_socket](documentation/isc_kea_config_dhcp_ddns_control_socket.md)
- [isc_kea_config_dhcp_ddns_forward_ddns_domain](documentation/isc_kea_config_dhcp_ddns_forward_ddns_domain.md)
- [isc_kea_config_dhcp_ddns_hooks_library](documentation/isc_kea_config_dhcp_ddns_hooks_library.md)
- [isc_kea_config_dhcp_ddns_loggers](documentation/isc_kea_config_dhcp_ddns_loggers.md)
- [isc_kea_config_dhcp_ddns_loggers_output](documentation/isc_kea_config_dhcp_ddns_loggers_output.md)
- [isc_kea_config_dhcp_ddns_reverse_ddns_domain](documentation/isc_kea_config_dhcp_ddns_reverse_ddns_domain.md)
- [isc_kea_config_dhcp_ddns_tsig_key](documentation/isc_kea_config_dhcp_ddns_tsig_key.md)
- [isc_kea_install](documentation/isc_kea_install.md)
- [isc_kea_service](documentation/isc_kea_service.md)
