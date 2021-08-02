<img align="right" src="./assets/k8s-logo.png" width="100">

In the past module the _KubeCtl_ CLI tool was covered, let's dive deep into some additionals commands and kubectl functions.

## Get the nodes including the region and zone

This one is particularly useful when you are working with kubernetes in the cloud, like EKS, GKS, AKS, if you have node groups in different regions and zones, this command can be really handy

`kubectl get nodes --label-columns failure-domain.beta.kubernetes.io/region,failure-domain.beta.kubernetes.io/zone`{{execute}}

## Get labels attached to the nodes

When you work with nodeSelectors labels are key to deploy apps to the desired node group, you can get the labels attached to each node by running: 

`kubectl get nodes --show-labels`{{execute}}

## Impersonate as a user or group

If you need to run a task as a user or group this command can be really helpful.

`kubectl get pods --as-group="somecompany:somecompany-teamname" --as="test"`

## Get all pod status

`kubectl get pods -o=jsonpath='{.items[*].status.phase}' --all-namespaces`
