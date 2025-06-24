# isc_kea__config_database

[Back to resource list](../README.md#resources)

## Actions

- None

## Properties

| Name                  | Name? | Type           | Default | Description | Allowed Values                                                                                |
| --------------------- | ----- | -------------- | ------- | ----------- | --------------------------------------------------------------------------------------------- |
| `type`                |       | String, Symbol |         |             | memfile, mysql, postgresql, cdl                                                               |
| `persist`             |       | true, false    |         |             |                                                                                               |
| `database_name`       |       | String         |         |             |                                                                                               |
| `host`                |       | String         |         |             |                                                                                               |
| `port`                |       | Integer        |         |             |                                                                                               |
| `user`                |       | String         |         |             |                                                                                               |
| `password`            |       | String         |         |             |                                                                                               |
| `contact_points`      |       | String         |         |             |                                                                                               |
| `keyspace`            |       | String         |         |             |                                                                                               |
| `connect_timeout`     |       | Integer        |         |             |                                                                                               |
| `max_reconnect_tries` |       | Integer        |         |             |                                                                                               |
| `reconnect_wait_time` |       | Integer        |         |             |                                                                                               |
| `on_fail`             |       | String         |         |             | stop-retry-exit, serve-retry-exit, serve-retry-continue                                       |
| `lfc_interval`        |       | Integer        |         |             |                                                                                               |
| `max_row_errors`      |       | Integer        |         |             |                                                                                               |
| `request_timeout`     |       | Integer        |         |             |                                                                                               |
| `tcp_keepalive`       |       | Integer        |         |             |                                                                                               |
| `tcp_nodelay`         |       | true, false    |         |             |                                                                                               |
| `consistency`         |       | String         |         |             | any, one, two, three, quorum, all, local-quorum, each-quorum, serial, local-serial, local-one |
| `serial_consistency`  |       | String         |         |             | any, one, two, three, quorum, all, local-quorum, each-quorum, serial, local-serial, local-one |
| `readonly`            |       | true, false    |         |             |                                                                                               |
| `read_timeout`        |       | Integer        |         |             |                                                                                               |
| `write_timeout`       |       | Integer        |         |             |                                                                                               |
| `tcp_user_timeout`    |       | Integer        |         |             |                                                                                               |
