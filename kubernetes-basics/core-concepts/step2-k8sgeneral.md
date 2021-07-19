
As you might already noticed, the primary way to interact with Kubernetes from the command-line is a tool called KubeCtl.

_kubectl_ allows to manage the Cluster multiple aspects, regardless of where Kubernetes is running. In the beginning it may take some time to keep the purpose of these commands separate.

Use a few kubectl commands to discover more about this Kubernetes instance.

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
