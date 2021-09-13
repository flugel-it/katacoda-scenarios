# Node Selectors

A *Daemonset* guarantees that a copy of a Pod is running in the defined node set, this could be all the nodes or a group.
As nodes are added to the cluster, Pods are added to them. As nodes are removed from the cluster, those Pods are garbage collected. Deleting a DaemonSet will clean up the Pods it created.

Some typical uses of a DaemonSet are:

* running a cluster storage daemon on every node
* running a logs collection daemon on every node
* running a node monitoring daemon on every node


## Create a DaemonSet

The daemonset.yaml file below describes a DaemonSet that runs the `fluentd-elasticsearch` Docker image:

````
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: fluentd-elasticsearch
  namespace: kube-system
  labels:
    k8s-app: fluentd-logging
spec:
  selector:
    matchLabels:
      name: fluentd-elasticsearch
  template:
    metadata:
      labels:
        name: fluentd-elasticsearch
    spec:
      tolerations:
      # this toleration is to have the daemonset runnable on master nodes
      # remove it if your masters can't run pods
      - key: node-role.kubernetes.io/master
        operator: Exists
        effect: NoSchedule
      containers:
      - name: fluentd-elasticsearch
        image: quay.io/fluentd_elasticsearch/fluentd:v2.5.2
        resources:
          limits:
            memory: 200Mi
          requests:
            cpu: 100m
            memory: 200Mi
        volumeMounts:
        - name: varlog
          mountPath: /var/log
        - name: varlibdockercontainers
          mountPath: /var/lib/docker/containers
          readOnly: true
      terminationGracePeriodSeconds: 30
      volumes:
      - name: varlog
        hostPath:
          path: /var/log
      - name: varlibdockercontainers
        hostPath:
          path: /var/lib/docker/containers
````

Run `kubectl apply -f https://github.com/flugel-it/katacoda-scenarios/kubernetes-basics/day3-k8s-advanced/assets/daemonset.yaml`, to create a DaemonSet.


`kubectl apply -f https://github.com/flugel-it/katacoda-scenarios/kubernetes-basics/day3-k8s-advanced/assets/daemonset.yaml` {{execute}}


## Required Fields

* apiVersion
* kind
* metadata
* .spec
* .spec.template
  The .spec.template is a pod template. It has exactly the same schema as a Pod, except it is nested and does not have an apiVersion or kind.

* .spec.selector
  The .spec.selector field is a pod selector. It works the same as the .spec.selector of a Job.

## How Daemon Pods are scheduled

DaemonSet pods are created and scheduled by the DaemonSet controller instead. That introduces the following issues:

* Inconsistent Pod behavior: Normal Pods waiting to be scheduled are created and in `Pending` state, but DaemonSet pods are not created in `Pending` state. This is confusing to the user.
* Pod preemption is handled by default scheduler. When preemption is enabled, the DaemonSet controller will make scheduling decisions without considering pod priority and preemption.

`ScheduleDaemonSetPods` allows you to schedule DaemonSets using the default scheduler instead of the DaemonSet controller, by adding the `NodeAffinity` term to the DaemonSet pods, instead of the `.spec.nodeName` term.

### Node affinity example

````
nodeAffinity:
  requiredDuringSchedulingIgnoredDuringExecution:
    nodeSelectorTerms:
    - matchFields:
      - key: metadata.name
        operator: In
        values:
        - target-host-name
````

### Taints and Tolerations

Daemon Pods respect taints and tolerations, in addition, the following tolerations are added to DaemonSet Pods automatically according to the related features.


| Toleration Key                         | Effect     | Version | Description                                                                                          |   |
|----------------------------------------|------------|---------|------------------------------------------------------------------------------------------------------|---|
| node.kubernetes.io/not-ready           | NoExecute  | 1.13+   | DaemonSet pods will not be evicted when there are node problems such as a network partition.         |   |
| node.kubernetes.io/unreachable         | NoExecute  | 1.13+   | DaemonSet pods will not be evicted when there are node problems such as a network partition.         |   |
| node.kubernetes.io/disk-pressure       | NoSchedule | 1.8+    | DaemonSet pods tolerate disk-pressure attributes by default scheduler.                               |   |
| node.kubernetes.io/memory-pressure     | NoSchedule | 1.8+    | DaemonSet pods tolerate memory-pressure attributes by default scheduler.                             |   |
| node.kubernetes.io/unschedulable       | NoSchedule | 1.12+   | DaemonSet pods tolerate unschedulable attributes by default scheduler.                               |   |
| node.kubernetes.io/network-unavailable | NoSchedule | 1.12+   | DaemonSet pods, who uses host network, tolerate network-unavailable attributes by default scheduler. |   |


## Communicating with Daemon Pods

Some possible patterns for communicating with Pods in a DaemonSet are:

* Push: Pods in the DaemonSet are configured to send updates to another service, such as a stats database. They do not have clients.
* NodeIP and Known Port: Pods in the DaemonSet can use a hostPort, so that the pods are reachable via the node  IPs. Clients know the list of node IPs somehow, and know the port by convention.
* DNS: Create a headless service with the same pod selector, and then discover DaemonSets using the endpoints resource or retrieve multiple A records from DNS.
* Service: Create a service with the same Pod selector, and use the service to reach a daemon on a random node. (No way to reach specific node.)

Additional documentation about daemonsets [here](https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/)