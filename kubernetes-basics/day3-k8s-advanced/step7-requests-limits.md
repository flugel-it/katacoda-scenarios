# Requests and Limits

When you specify a Pod, you can optionally specify how much of each resource a Container needs. The most common resources to specify are CPU and memory (RAM); there are others.

When you specify the resource *request* for Containers in a Pod, the scheduler uses this information to decide which node to place the Pod on. 

When you specify a resource *limit* for a Container, the kubelet enforces those limits so that the running container is not allowed to use more of that resource than the *limit* you set. 

The kubelet also reserves at least the *request* amount of that system resource specifically for that container to use.

## Requests vs Limits

If the node where a Pod is running has enough of a resource available, it's possible (and allowed) for a container to use more resource than its *request* for that resource specifies. However, a container is not allowed to use more than its resource *limit*.

## Resource Types

CPU and memory are each a resource type. CPU represents compute processing, Memory is specified in units of bytes.

## Huge Pages

If you're using Kubernetes v1.14 or newer, you can specify huge page resources. Huge pages are a Linux-specific feature where the node kernel allocates blocks of memory that are much larger than the default page size.

For example, on a system where the default page size is 4KiB, you could specify a limit, hugepages-2Mi: 80Mi. If the container tries allocating over 40 2MiB huge pages (a total of 80 MiB), that allocation fails.

CPU and memory are collectively referred to as compute resources, or resources.

## Resource Types

Each Container of a Pod can specify one or more of the following:

* spec.containers[].resources.limits.cpu
* spec.containers[].resources.limits.memory
* spec.containers[].resources.limits.hugepages-<size>
* spec.containers[].resources.requests.cpu
* spec.containers[].resources.requests.memory
* spec.containers[].resources.requests.hugepages-<size>

# Resource units in Kubernetes

## Meaning of CPU 

Limits and requests for CPU resources are measured in cpu units. One cpu, in Kubernetes, is equivalent to 1 vCPU/Core for cloud providers and 1 hyperthread on bare-metal Intel processors.

Fractional requests are allowed. A Container with `spec.containers[].resources.requests.cpu` of `0.5` is guaranteed half as much CPU as one that asks for 1 CPU. The expression `0.1` is equivalent to the expression `100m`, which can be read as "one hundred millicpu". Some people say "one hundred millicores", and this is understood to mean the same thing. A request with a decimal point, like 0.1, is converted to 100m by the API, and precision finer than 1m is not allowed. For this reason, the form 100m might be preferred.

CPU is always requested as an absolute quantity, never as a relative quantity; 0.1 is the same amount of CPU on a single-core, dual-core, or 48-core machine.

