# Node Selectors

`nodeSelector` is the simplest recommended form of node selection constraint. `nodeSelector` is a field of PodSpec. It specifies a map of key-value pairs. For the pod to be eligible to run on a node, the node must have each of the indicated key-value pairs as labels (it can have additional labels as well). The most common usage is one key-value pair.

Let's walk through an example of how to use nodeSelector.

## Attach label to the node

Run kubectl get nodes to get the names of your cluster's nodes. 

`kubectl get nodes`{{execute}}

Pick out the one that you want to add a label to, and then run kubectl label nodes <node-name> <label-key>=<label-value> to add a label to the node you've chosen. For example, if my node name is 'node01' and my desired label is 'hardware=high-spec', then I can run `kubectl label nodes node01 `.

`kubectl label nodes node01 hardware=high-spec`{{execute}}

Expected output
````
node/node01 labeled
````

You can verify that it worked by re-running `kubectl get nodes --show-labels` and checking that the node now has a label. You can also use `kubectl describe node "nodename"` to see the full list of labels of the given node.

`kubectl get nodes --show-labels`{{execute}}

## NodeSelector field to your pod configuration

In the following pod manifest, a node selector for a sample pod is assigned.
Notice that key-values are `hardware=high-spec`

````
apiVersion: v1
kind: Pod
metadata:
  name: nginx
  labels:
    env: test
spec:
  containers:
  - name: nginx
    image: nginx
    imagePullPolicy: IfNotPresent
  nodeSelector:
    hardware: high-spec
````

Execute `kubectl apply -f https://github.com/flugel-it/katacoda-scenarios/kubernetes-basics/day3-k8s-advanced/assets/nodeselector.yaml`, the Pod will get scheduled on the node that you attached the label to. You can verify that it worked by running `kubectl get pods -o wide` and looking at the "NODE" that the Pod was assigned to.


`kubectl apply -f https://github.com/flugel-it/katacoda-scenarios/kubernetes-basics/day3-k8s-advanced/assets/nodeselector.yaml`{{execute}}

`kubectl get pods -o wide`{{execute}}