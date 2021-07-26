# Kubernets Core Concepts - ETCD#

![Kubernetes](./assets/kubernetes.png "Kubernetes")

Here is some information about ETCD, to simplify it you can think of etcd as the Kubernetes database.

Here are some key facts about etcd.

## What is etcd?

etcd is a consistent distributed key-value store. Mainly used as a separate coordination service, in distributed systems. And designed to hold small amounts of data that can fit entirely in memory.

## How do you pronounce etcd? 
etcd is pronounced /ˈɛtsiːdiː/, and means “distributed etc directory.”

## Do clients have to send requests to the etcd leader? 
Raft is leader-based; the leader handles all client requests which need cluster consensus. However, the client does not need to know which node is the leader. Any request that requires consensus sent to a follower is automatically forwarded to the leader. Requests that do not require consensus (e.g., serialized reads) can be processed by any cluster member.

## How to backup a etcd cluster
etcdctl provides a snapshot command to create backups. See [backup](https://etcd.io/docs/v3.5/faq/#:~:text=create%20backups.%20See-,backup,-for%20more%20details) for more details.


Etcd is a consistent and highly-available key value store used as Kubernetes' backing store for all cluster data.

If your Kubernetes cluster uses etcd as its backing store, make sure you have a back up plan for those data.

Let's review some commands:

Launch ETCD
 `etcd`

Set and get a key

 `etcdctl put greeting "Hello, etcd"`

Retrieve a key:

 `etcdctl get greeting`

Note:
 It is uncommon to interact directly with etcd, the cluster is managed by it's APIs trhough the **kube-api** service, having said that you have know interacted with it!

 Note2: 
  Commands are not being executed in the current sandbox due to already have an ETCD database running, you can try the commands in your own environment.