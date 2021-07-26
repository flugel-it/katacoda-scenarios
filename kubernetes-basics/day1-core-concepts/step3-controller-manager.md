# Kube-Controller Manager

<img align="right" src="./assets/k8s-logo.png" width="100">

The Kubernetes controller manager is a daemon that embeds the core control loops shipped with Kubernetes. In applications of robotics and automation, a control loop is a non-terminating loop that regulates the state of the system. In Kubernetes, a controller is a control loop that watches the shared state of the cluster through the apiserver and makes changes attempting to move the current state towards the desired state. Examples of controllers that ship with Kubernetes today are the replication controller, endpoints controller, namespace controller, and serviceaccounts controller.

for additional information related to kube-controller-manager flags please read the [official documentation](https://kubernetes.io/docs/reference/command-line-tools-reference/kube-controller-manager/)