# Kubernets Core Concepts - ETCD#

![Kubernetes](./assets/kubernetes.png "Kubernetes")

Welcome to the ETCD Module!

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

In the following section you will interact with etcd.

------
<p style="text-align: center; padding: 1em; margin: 3em; margin-left: 10em; margin-right: 10em; border-; 1px; border-color: olive;  border-radius: 12px; border-style:outset">
<img align="left" src="./assets/flugel-it.jpeg" width="100" style="border-radius: 12px">
Courious about DevOps, Open Source and Cloud technologies? <br> Check out our blog at <br>https://flugel.it/resources/blog/<br> 
<br><br>
</p>
