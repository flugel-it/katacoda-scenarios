# Conclusion #

Once an application is in a container, it's fairly simple to ask Kubernetes to serve up the container in multiple Pods fronted with a load balancing Service. Thereafter, Kubernetes dutifully respects your declared request by ensuring the application remains running on the cluster.

There are many other types of resources that can be added to Kubernetes besides just Pods, Services and Deployments, however these are the most common resources. Later, explore the Helm scenarios to see how whole _charts_ of more complex deployments can be installed.

## Lessons Learned ##

With these steps you have learned:

- &#x2714; how to **Deploy** an application,
- &#x2714; how to **Scale** an application,
- &#x2714; how to load balance an application with a **Service** for multiple **Pods** of an application,
- &#x2714; how **Resilience** maintains the declared state even with failures,
- &#x2714; how to **Roll out** new versions of an application.
