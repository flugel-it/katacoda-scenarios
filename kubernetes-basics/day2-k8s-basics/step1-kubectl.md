<img align="right" src="./assets/k8s-logo.png" width="100">

As you might already noticed, the primary way to interact with Kubernetes from the command-line is a tool called KubeCtl.

_kubectl_ allows to manage the Cluster multiple aspects, regardless of where Kubernetes is running. In the beginning it may take some time to keep the purpose of these commands separate.

The most common options when executing __kubectl__ are:
- create
```
  Create a resource from a file or from stdin.
   JSON and YAML formats are accepted.

  Examples:
  Create a pod using the data in pod.json.
  kubectl create -f ./pod.json
```

- expose
````
 Expose a resource as a new Kubernetes service.
 Possible resources include (case insensitive):

 pod (po), service (svc), replicationcontroller (rc), deployment (deploy), replicaset (rs)
 Examples:
  # Create a service for a replicated nginx, which serves on port 80 and connects to the containers on port 8000.
  kubectl expose rc nginx --port=80 --target-port=8000
````

- explain
````
 List the fields for supported resources

 This command describes the fields associated with each supported API resource.
 Examples:
  # Get the documentation of the resource and its fields
````
 `kubectl explain pods`{{execute}}

- get
````
 Display one or many resources

 Prints a table of the most important information about the specified resources.
 Examples:
  # List all pods in ps output format.
````
 `kubectl get pods`{{execute}}

- edit
````
 Edit a resource using the default editor.
 Examples:
  # Edit the service named 'docker-registry':
  kubectl edit svc/docker-registry
````

- delete
````
 Delete resources by filenames, stdin, resources and names, or by resources and label selector.
 Examples:
  # Delete a pod using the type and name specified in pod.json.
  kubectl delete -f ./pod.json
````

- scale
````
 Set a new size for a Deployment, ReplicaSet, Replication Controller, or StatefulSet.
 Examples:
  # Scale a replicaset named 'foo' to 3.
  kubectl scale --replicas=3 rs/foo
````

- describe
````
 Show details of a specific resource or group of resources
 Use "kubectl api-resources" for a complete list of supported resources.

 Examples:
  # Describe a node
  kubectl describe nodes kubernetes-node-emt8.c.myproject.internal
````

- logs
````
 Print the logs for a container in a pod or specified resource. If the pod has only one container, the container name is optional.

 Examples:
  # Return snapshot logs from pod nginx with only one container
  kubectl logs nginx
````

- exec
````
 Execute a command in a container.

 Examples:
  # Get output from running 'date' command from pod mypod, using the first container by default
  kubectl exec mypod -- date
````


- apply
```
 Apply a configuration to a resource by filename or stdin. The resource name must be specified. This resource will be created if it doesn't exist yet.
 Examples:
  # Apply the configuration in pod.json to a pod.
  kubectl apply -f ./pod.json
````

Let's use a few kubectl commands to discover more about this Kubernetes instance.

Get information about the _kubectl_ tool including it's version and about the cluster which is currently connected.

`kubectl version`{{execute}}

Get information about the nodes that are running in the cluster.

`kubectl get nodes`{{execute}}

If you wish to get additional information about the nodes, you can run.

`kubectl get nodes -o wide`{{execute}}

There are various ways to get details about this cluster.

`kubectl get componentstatus`{{execute}}

`kubectl cluster-info`{{execute}}

The following are really important to understand the conext, meaning to which cluster am I connecting to, with which user? This is very usefull when you start interacting with multiple clusters.

`kubectl config view`{{execute}}

`kubectl config get-contexts`{{execute}}

More details are revealed with the describe command.

`kubectl describe node node01`{{execute}}

Events can be listed.

`kubectl get events`{{execute}}