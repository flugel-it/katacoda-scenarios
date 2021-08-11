# Taints
Taints are tags that are added to a node to repel a set of pods.

Tolerations are applied to pods, and allow the pods to schedule onto nodes with matching taints.

Taints and tolerations work together to ensure that pods are not scheduled onto inappropriate nodes. One or more taints are applied to a node; this marks that the node should not accept any pods that do not tolerate the taints.

## Example

`kubectl taint nodes node01 key1=value1:NoSchedule`{{execute}}

Now let's get the node properties to see the taint

`kubectl get nodes node01 -o yaml`{{execute}}

You might have noticed that the taint has a key `key1` and a value `value1`,
tolerations needs to match the key and value of the taint.
Let's look a the following toleration example.

````
tolerations:
- key: "key1"
  operator: "Equal"
  value: "value1"
  effect: "NoSchedule"
````
