# Kube-Scheduler

<img align="right" src="./assets/k8s-logo.png" width="100">

The Kubernetes scheduler is a control plane process which assigns Pods to Nodes. The scheduler determines which Nodes are valid placements for each Pod in the scheduling queue according to constraints and available resources. The scheduler then ranks each valid Node and binds the Pod to a suitable Node. Multiple different schedulers may be used within a cluster; kube-scheduler is the reference implementation. See scheduling for more information about scheduling and the kube-scheduler component.

Kube scheduller can be interacted via the CLI (uncommon), for example using the following command.

`kube-scheduler --kubeconfig ~/.kube/config`

Unfortunately this command will not work in this sandbox due to restricted permissions.

for additional information related to kube-scheduler flags please read the [official documentation](https://kubernetes.io/docs/reference/command-line-tools-reference/kube-scheduler/)