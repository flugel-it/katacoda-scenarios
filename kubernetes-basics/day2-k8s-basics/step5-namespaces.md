By default, a Kubernetes cluster will instantiate a default namespace when provisioning the cluster to hold the default set of Pods, Services, and Deployments used by the cluster.

Let's get the current namespaces

`kubectl get namespaces`{{execute}}

Expected output
````
default           Active   13m
kube-node-lease   Active   13m
kube-public       Active   13m
kube-system       Active   13m
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
default           Active   14m   <none>
development       Active   2s    name=development
kube-node-lease   Active   14m   <none>
kube-public       Active   14m   <none>
kube-system       Active   14m   <none>
````

Let's delete the development namespace, notice that this will delete all the resources in it

`kubectl delete namespace development`{{execute}}

Expected output:
````
namespace "development" deleted
````