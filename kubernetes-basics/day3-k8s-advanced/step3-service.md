The _hello-world_ app is running in a Pod. Each Pod in Kubernetes is assigned an internal and virtual IP address at 10.xx.xx.xx. However, from outside of the cluster these IPs are not reachable, and never should be. Even within the cluster other applications normally should not attempt to address these Pods IPs. Instead each replicated Pod is fronted by a single service.

This service can be referenced by its label, and therefore access with the help of an internal Domain Name System (DNS) that will resolve the URL to the service based on the label. The Service will add a layer of indirection where it will know how to connect to the Pod. All the other applications in the cluster will connect to the service through DNS lookups and the services will connect to the specific Pods.

## Defining a Service
A Service in Kubernetes is a REST object, similar to a Pod. Like all of the REST objects, you can POST a Service definition to the API server to create a new instance. The name of a Service object must be a valid RFC 1035 label name.

For example, suppose you have a set of Pods where each listens on TCP port 9376 and contains a label app=MyApp:
````
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  selector:
    app: MyApp
  ports:
    - protocol: TCP
      port: 80
      targetPort: 9376
````

## Publishing Services (ServiceTypes)

For some parts of your application (for example, frontends) you may want to expose a Service onto an external IP address, that's outside of your cluster.

Kubernetes ServiceTypes allow you to specify what kind of Service you want. The default is ClusterIP.

Type values and their behaviors are:

### ClusterIP: 
 Exposes the Service on a cluster-internal IP. Choosing this value makes the Service only reachable from within the cluster. This is the default ServiceType.

### NodePort: 
 Exposes the Service on each Node's IP at a static port (the NodePort). A ClusterIP Service, to which the NodePort Service routes, is automatically created. You'll be able to contact the NodePort Service, from outside the cluster, by requesting <NodeIP>:<NodePort>.

### LoadBalancer: 
 Exposes the Service externally using a cloud provider's load balancer. NodePort and ClusterIP Services, to which the external load balancer routes, are automatically created.

### ExternalName: 
 Maps the Service to the contents of the externalName field (e.g. foo.bar.example.com), by returning a CNAME record with its value. No proxying of any kind is set up.


# Practice

Expose the Pod by fronting it with a Service labeled _hello_.

`kubectl expose deployment hello-node --type=NodePort --port=31001`{{execute}}

`kubectl get service hello-node`{{execute}}

Let's get details on the Service exposed

`kubectl describe service hello-node`{{execute}}

Because of Katacoda's virtualization you cannot address this service from your browser, but you can use Katacoda's domain as the URL to the same service. Notice the same port number placed in the subdomain of the URL.

`curl -s https://[[HOST_SUBDOMAIN]]-31002-[[KATACODA_HOST]].environments.katacoda.com/`{{execute}}

For additional information on services, please check the official [documentation](https://kubernetes.io/docs/concepts/services-networking/service/)