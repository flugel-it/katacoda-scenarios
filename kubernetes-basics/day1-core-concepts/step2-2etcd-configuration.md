## ETCD Configuration

Etcd is configurable through a configuration file, various command-line flags, and environment variables.

A reusable configuration file is a YAML file made with name and value of one or more command-line flags described below. In order to use this file, specify the file path as a value to the --config-file flag or ETCD_CONFIG_FILE environment variable. The [sample configuration](https://etcd.io/docs/v3.5/op-guide/configuration/#:~:text=environment%20variable.%20The-,sample%20configuration%20file,-can%20be%20used) file can be used as a starting point to create a new configuration file as needed.

Options set on the command line take precedence over those from the environment. If a configuration file is provided, other command line flags and environment variables will be ignored. 
For example, `etcd --config-file etcd.conf.yml.sample --data-dir /tmp` will ignore the --data-dir flag.

The official etcd ports are **2379** for client requests and **2380** for peer communication. The etcd ports can be set to accept TLS traffic, non-TLS traffic, or both TLS and non-TLS traffic.

## Miscellaneous Flags

- –config-file
Load server configuration from a file. Note that if a configuration file is provided, other command line flags and environment variables will be ignored.
default: ""
example: sample configuration file


## Member Flags

There are a lot of flags that can be invoked when configuring etcd, in this section the most relevant ones will be reviewed, please read the [official doc.](https://etcd.io/docs/v3.5/op-guide/configuration/) for additional information.

- -name
This value is referenced as this node’s own entries listed in the `--initial-cluster` flag (e.g., default=http://localhost:2380). This needs to match the key used in the flag if using static bootstrapping. When using discovery, each member must have a unique name. Hostname or machine-id can be a good choice.

- –data-dir 
Path to the data directory.
default: “${name}.etcd”

- –snapshot-count 
Number of committed transactions to trigger a snapshot to disk.
default: “100000”

- –election-timeout 
Time (in milliseconds) for an election to timeout. See Documentation/tuning.md for details.
default: “1000”

- –max-txn-ops
Maximum number of operations permitted in a transaction.
default: 128

- –grpc-keepalive-timeout
Additional duration of wait before closing a non-responsive connection (0 to disable).
default: 20s

## Clustering flags

`--initial-advertise-peer-urls`, `--initial-cluster`, `--initial-cluster-state`, and `--initial-cluster-token` flags are used in bootstrapping (static bootstrap, discovery-service bootstrap or runtime reconfiguration) a new member, and ignored when restarting an existing member.

`--discovery` prefix flags need to be set when using discovery service.

- –initial-advertise-peer-urls
List of this member’s peer URLs to advertise to the rest of the cluster. These addresses are used for communicating etcd data around the cluster. At least one must be routable to all cluster members. These URLs can contain domain names.
default: “http://localhost:2380”
example: “http://example.com:2380, http://10.0.0.1:2380”

- –initial-cluster 
Initial cluster configuration for bootstrapping.
default: “default=http://localhost:2380”
The key is the value of the --name flag for each node provided. The default uses default for the key because this is the default for the --name flag.

- –initial-cluster-state 
Initial cluster state (“new” or “existing”). Set to new for all members present during initial static or DNS bootstrapping. If this option is set to existing, etcd will attempt to join the existing cluster. If the wrong value is set, etcd will attempt to start but fail safely.
default: “new”

- –initial-cluster-token 
Initial cluster token for the etcd cluster during bootstrap.
default: “etcd-cluster”

