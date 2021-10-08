<img align="right" src="./assets/k8s-logo.png" width="100">

Kubernetes objects can quickly be created, updated, and deleted directly using imperative commands built into the kubectl command-line tool. This document explains how those commands are organized and how to use them to manage live objects.

## Kinds of object management

The kubectl tool supports three kinds of object management:

* Imperative commands
* Imperative object configuration
* Declarative object configuration

See [Kubernetes Object Management](https://kubernetes.io/docs/concepts/overview/working-with-objects/object-management/) for a discussion of the advantages and disadvantage of each kind of object management.

### Object Creation

Most of the objects can be created with verb-driven commands.

`run`: Create a new Pod to run a Container.
`expose`: Create a new Service object to load balance traffic across Pods.
`autoscale`: Create a new Autoscaler object to automatically horizontally scale a controller, such as a Deployment.
`create` <objecttype> [<subtype>] <instancename>

### Update Objects

Objects can be updated with verb-driven commands as well.

`scale`: Horizontally scale a controller to add or remove Pods by updating the replica count of the controller.
`annotate`: Add or remove an annotation from an object.
`label`: Add or remove a label from an object.
`set` <field>: Set an aspect of an object.
`edit`: Directly edit the raw configuration of a live object by opening its configuration in an editor.
`patch`: Directly modify specific fields of a live object by using a patch string. For more details on patch strings, see the patch section in API Conventions.

### Delete Objects

`delete` <type>/<name>

Example: `kubectl delete deployment/nginx`

### View Objects

`get`: Prints basic information about matching objects. Use get -h to see a list of options.
`describe`: Prints aggregated detailed information about matching objects.
`logs`: Prints the stdout and stderr for a container running in a Pod.

### Set Objects

There are some object fields that don't have a flag you can use in a `create` command. In some of those cases, you can use a combination of `set` and `create` to specify a value for the field before object creation.

`kubectl create service clusterip my-svc --clusterip="None" -o yaml --dry-run=client | kubectl set selector --local -f - 'environment=qa' -o yaml | kubectl create -f -`

1. The `kubectl create service -o yaml --dry-run=client` command creates the configuration for the Service, but prints it to stdout as YAML instead of sending it to the Kubernetes API server.
2. The `kubectl set selector --local -f - -o yaml` command reads the configuration from stdin, and writes the updated configuration to stdout as YAML.
3. The `kubectl create -f -` command creates the object using the configuration provided via stdin.

### Edit Objects before creation

You can use kubectl create --edit to make arbitrary changes to an object before it is created. See example below:

`kubectl create service clusterip my-svc --clusterip="None" -o yaml --dry-run=client > /tmp/srv.yaml`
`kubectl create --edit -f /tmp/srv.yaml`

1. The `kubectl create service` command creates the configuration for the Service and saves it to `/tmp/srv.yaml`.
2. The `kubectl create --edit` command opens the configuration file for editing before it creates the object.
