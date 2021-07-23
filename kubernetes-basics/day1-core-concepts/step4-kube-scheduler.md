# Kube-Scheduler

<img align="right" src="./assets/k8s-logo.png" width="100">

The Kubernetes scheduler is a control plane process which assigns Pods to Nodes. The scheduler determines which Nodes are valid placements for each Pod in the scheduling queue according to constraints and available resources. The scheduler then ranks each valid Node and binds the Pod to a suitable Node. Multiple different schedulers may be used within a cluster; kube-scheduler is the reference implementation. See scheduling for more information about scheduling and the kube-scheduler component.

Let's try the command line of kube-controller-manager.

`kube-scheduler --kubeconfig ~/.kube/config`{{execute}}


### Expected output
````
I0723 11:57:52.160915   20324 serving.go:347] Generated self-signed cert in-memory
error loading config file "/root/.kube/config": open /root/.kube/config: permission denied
````

This is correct in the current environment due to having an already running cluster.

for additional information related to kube-controller-manager flags please read the [official documentation](https://kubernetes.io/docs/reference/command-line-tools-reference/kube-scheduler/)