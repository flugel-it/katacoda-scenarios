<img align="right" src="./assets/k8s-logo.png" width="100">

When you deploy Kubernetes, you get a cluster.

A Kubernetes cluster consists of a set of worker machines, called nodes, that run containerized applications. Every cluster has at least one worker node.

The worker node(s) host the Pods that are the components of the application workload. The control plane manages the worker nodes and the Pods in the cluster. In production environments, the control plane usually runs across multiple computers and a cluster usually runs multiple nodes, providing fault-tolerance and high availability.

## Kubernetes Components ##

Here's the diagram of a Kubernetes cluster with all the components tied together.
<img align="center" src="./assets/k8s-architecture.jpeg" width="200">