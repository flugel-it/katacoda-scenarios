# Deployments

A Deployment provides declarative updates for Pods and ReplicaSets.

You describe a desired state in a Deployment, and the Deployment Controller changes the actual state to the desired state at a controlled rate. You can define Deployments to create new ReplicaSets, or to remove existing Deployments and adopt all their resources with new Deployments.

## Use Cases
The following are typical use cases for Deployments:

### Create a Deployment to rollout a ReplicaSet.
 The ReplicaSet creates Pods in the background. Check the status of the rollout to see if it succeeds or not.
### Declare the new state of the Pods by updating the PodTemplateSpec of the Deployment. 
 A new ReplicaSet is created and the Deployment manages moving the Pods from the old ReplicaSet to the new one at a controlled rate. Each new ReplicaSet updates the revision of the Deployment.
### Rollback to an earlier Deployment revision
 if the current state of the Deployment is not stable. Each rollback updates the revision of the Deployment.
### Scale up the Deployment to facilitate more load.


## Creating a Deployment
The following is an example of a Deployment. It creates a ReplicaSet to bring up echoserver Pods:

````
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  labels:
    run: hello
  name: hello
spec:
  replicas: 1
  selector:
    matchLabels:
      run: hello
  template:
    metadata:
      labels:
        run: hello
    spec:
      containers:
      - image: k8s.gcr.io/echoserver:1.9
        name: hello
        ports:
        - containerPort: 8080
````


### Loading a deployment
Pods are often replicated for handling parallel requests. The Service will take care of _round robin_ load balancing across the available Pods.

We will scale the hello Pod up and down. First, in another terminal start a continuous loop that puts some load the service.

`while true; do curl -s https://[[HOST_SUBDOMAIN]]-31002-[[KATACODA_HOST]].environments.katacoda.com/ -w 'Time: %{time_total}' | grep -E 'Hostname|Time' | xargs; done`{{execute T2}}

With all the curl requests in the loop, the single Pod instance is producing all the responses. However with distributed systems with a deep pool of resources it's very common to add more processes that can service multiple requests. Ask Kubernetes to scaling up the _echoservice_ across more Pods.

### Scale a deployment
`kubectl scale deployment hello-node --replicas=3`{{execute T1}}

Kubernetes spins up new and duplicated Pods and the same service begins to balance the requests across the pods.

### Get the status of the pods of this deployment
`kubectl get pods -l app=hello-node`{{execute T1}}

The single service for these 3 pods now has the IPs of the three pods and load balances between them.

### Describe the service of the deployment
`kubectl describe service hello-node | grep "Endpoints"`{{execute}}

Look at the other terminal and in a few moments the output will indicate the load balancer is rotating the requests across the three nodes.

### Scale the deployment
Scale the Pods to zero and see what happens with the same _top_ command and the requests in the other terminal.

`kubectl scale deployment hello-node --replicas=0`{{execute T1}}

The list will show the pods Terminating, then in a moment the list will be blank.

`kubectl get pods`{{execute T1}}

Notice while the pod count is at zero the service running in Terminal 2 is reporting no responses. Soon the above command will report _No resources found_.

Scale the Pods back to 1 and see how the requests are restored.

`kubectl scale deployment hello-node --replicas=1`{{execute T1}}

A new pod should show in a moment.

`kubectl get deployments,pods`{{execute T1}}

A few moments later the metrics will be available for the new pod.

`kubectl get pods -l app=hello-node`{{execute T1}}
