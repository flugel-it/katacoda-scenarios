# Quiz

Before moving forwards, let's check some basic concepts with a quiz, if you don't get the correct answers on the first try it's fine, just go back to the appropriate lesson and review the topic.

## Kubectl, pods, services, namespaces, deployments
>>Q1: Select the most used __commands__ when executing __kubectl command__ <<
[] restore
[*] get
[] cluster
[*] create
[*] apply



>>Q2: Select the most used __commands__ when executing __kubectl command__<<
[*] delete
[*] explain
[] pod
[] call
[*] expose
[*] edit


>>Q3: Resources in the cluster can be edited from command line<<
(*) Correct
() Incorrect

>>Q4: Stateless Pods will keep their name even when restarted <<
() Correct
(*) Incorrect

>>Q5: Statefull Pods will keep their name even when restarted <<
(*) Correct
() Incorrect

>>Q6: Deleting a namespace will delete all the resources included in it <<
(*) Correct
() Incorrect

>>Q7: Which command shows the fields of a resource including an explanation? <<
=~= kubectl explain

>>Q8: Which are 4 service types available when exposing a service? <<
[*] ClusterIP
[] DNS
[] ExternalCluster
[*] NodePort
[] Proxy
[*] LoadBalancer
[*] ExternalName

>>Q9: Enter the command required to scale the my-deployment deployment to two replicas  <<
=== kubectl scale deployment my-deployment --replicas=2

>>Q10: If no namespace is declared when creatin resources resources will be ?<<
() Failed when trying to be created
() Deployed in a new random namespace
() Created without a namespace assigned in pending state
(*) Deployed in the default namespace
() Deployed in the kube-system namespace