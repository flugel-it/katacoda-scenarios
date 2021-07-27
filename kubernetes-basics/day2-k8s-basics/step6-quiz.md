# Quiz

Before moving forwards, let's check some basic concepts with a quiz, if you don't get the correct answers on the first try it's fine, just go back to the appropriate lesson and review the topic.

## Architecture of the Master and Worker node
>>Q1: Which of these are key components of the Master Node <<
[ ] Pods
[*] Kube Controller Manager
[*] Kube API
[ ] Namespaces
[*] Etcd


>>Q2: Etcd is a Structured Database that holds the metadata of the Cluster<<
() Correct
(*) Incorrect

>>Q2: Etcd is a Key Value store used as Kubernetes' backing store for all cluster data<<
(*) Correct
() Incorrect

>>Q4: A Pod is basically a container, no more than one container per pod is allowed<<
() Correct
(*) Incorrect

>>Q5: Which commands retreives the namespaces of a cluster<<
=== kubectl get namespaces

>>Q6: The control plane runs the services that manages the cluster <<
(*) Correct
() Incorrect

>>Q7: The Master Node can be deployed multiple times per installation <<
(*) Correct
() Incorrect

>>Q8: Persistent volumes are scoped at the __ level <<
[ ] Namespace
[ ] Pod
[ ] Container
[*] Cluster

>>Q9: Worker Nodes run the following components  <<
[*] Kubeproxy
[*] Kubelet
[*] Pods
[*] Services
[ ] Kube-API

>>Q10: What is the minimum manageable unit in the K8S Object model ?<<
() Service
() Deployment
(*) Pod
() Replicaset
() Master Node