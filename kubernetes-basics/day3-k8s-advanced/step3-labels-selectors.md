<img align="right" src="./assets/k8s-logo.png" width="100">

Labels are key/value pairs that are attached to objects, such as pods. Labels are intended to be used to specify identifying attributes of objects that are meaningful and relevant to users, but do not directly imply semantics to the core system. Labels can be used to organize and to select subsets of objects. Labels can be attached to objects at creation time and subsequently added and modified at any time. Each object can have a set of key/value labels defined. Each Key must be unique for a given object.

````
"metadata": {
  "labels": {
    "key1" : "value1",
    "key2" : "value2"
  }
}
````

Labels allow for efficient queries and watches and are ideal for use in UIs and CLIs. Non-identifying information should be recorded using annotations.

Example labels:

* `"release" : "stable"`, `"release" : "canary"`
* `"environment" : "dev"`, `"environment" : "qa"`, `"environment" : "production"`
* `"tier" : "frontend"`, `"tier" : "backend"`, `"tier" : "cache"`
* `"partition" : "customerA"`, `"partition" : "customerB"`
* `"track" : "daily"`, `"track" : "weekly"`


These are examples of commonly used labels; you are free to develop your own conventions. Keep in mind that label Key must be unique for a given object.

## Label example in a manifest

For example, here's the configuration file for a Pod that has two labels environment: production and app: nginx :

````
apiVersion: v1
kind: Pod
metadata:
  name: label-demo
  labels:
    environment: production
    app: nginx
spec:
  containers:
  - name: nginx
    image: nginx:1.14.2
    ports:
    - containerPort: 80
````

## Label selectors 
Unlike names and UIDs, labels do not provide uniqueness. In general, we expect many objects to carry the same label(s).

Via a label selector, the client/user can identify a set of objects. The label selector is the core grouping primitive in Kubernetes.

Two types of selectors are supported: equality-based and set-based.

### Equality-based requirement

Three kinds of operators are admitted =,==,!=

In the following example all resources with key equal to `environment`, `value` equal to `dev` and key equal to `tier`, value different than `backend` are selected: 
````
environment = dev
tier != backend
````

Let's look at it in a manifest

````
apiVersion: v1
kind: Pod
metadata:
  name: cuda-test
spec:
  containers:
    - name: cuda-test
      image: "k8s.gcr.io/cuda-vector-add:v0.1"
      resources:
        limits:
          nvidia.com/gpu: 1
  nodeSelector:
    environment: dev
````

## CLI

Both label selector styles can be used to list or watch resources via a REST client. For example, targeting apiserver with kubectl and using equality-based one may write:

`kubectl get pods -l environment=dev,tier=backend`