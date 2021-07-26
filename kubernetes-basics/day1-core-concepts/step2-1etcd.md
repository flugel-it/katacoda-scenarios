## ETCD

Etcd is a consistent and highly-available key value store used as Kubernetes' backing store for all cluster data.

If your Kubernetes cluster uses etcd as its backing store, make sure you have a back up plan for those data.

Launch ETCD
 `etcd &`{{execute}}

Set and get a key

 `etcdctl put greeting "Hello, etcd"`{{execute}}

Now that a key has been set, retrieve it:

 `etcdctl get greeting`{{execute}}

Note:
 It is uncommon to interact directly with etcd, the cluster is managed by it's APIs trhough the **kube-api** service, having said that you have know interacted with it!