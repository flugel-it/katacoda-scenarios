By default, a Kubernetes cluster will instantiate a default namespace when provisioning the cluster to hold the default set of Pods, Services, and Deployments used by the cluster.

Let's get the current namespaces

`kubectl get namespaces`{{execute}}

Expected output
````
NAME      STATUS    AGE
default   Active    13m
````


> Create a new Namespace.

Let's create two new namespaces to hold our work.

Use the file namespace-dev.json which describes a development namespace:

````
{
  "apiVersion": "v1",
  "kind": "Namespace",
  "metadata": {
    "name": "development",
    "labels": {
      "name": "development"
    }
  }
}
````


> `kubectl create -f https://k8s.io/examples/admin/namespace-dev.json`{{execute}}


Take a look at the __namespace__ including it's labels

`kubectl get namespaces --show-labels`{{execute}}

Expected output:
````
NAME          STATUS    AGE       LABELS
default       Active    32m       <none>
development   Active    29s       name=development
````
