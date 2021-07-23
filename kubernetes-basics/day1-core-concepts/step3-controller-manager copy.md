# Kube-Controller Manager

<img align="right" src="./assets/k8s-logo.png" width="100">

The Kubernetes controller manager is a daemon that embeds the core control loops shipped with Kubernetes. In applications of robotics and automation, a control loop is a non-terminating loop that regulates the state of the system. In Kubernetes, a controller is a control loop that watches the shared state of the cluster through the apiserver and makes changes attempting to move the current state towards the desired state. Examples of controllers that ship with Kubernetes today are the replication controller, endpoints controller, namespace controller, and serviceaccounts controller.

Let's try the command without any flags.

`kube-controller-manager --kubeconfig ~/.kube/config`{{execute}}


### Expected output
````
I0723 11:57:52.160915   20324 serving.go:347] Generated self-signed cert in-memory
error loading config file "/root/.kube/config": open /root/.kube/config: permission denied
````

This is correct in the current environment due to having an already running cluster.

for additional information related to kube-controller-manager flags please read the [official documentation](https://kubernetes.io/docs/reference/command-line-tools-reference/kube-controller-manager/)