# Quiz

Before moving forwards, let's check some basic concepts with a quiz, if you don't get the correct answers on the first try it's fine, just go back to the appropriate lesson, review the topic and come back!

## Kubectl
>>Q1: Select the correct __command__ to get the labels of a set of nodes <<
() kubectl get pods --show-labels
(*) kubectl get nodes --show-labels
() kubectl get labels --all-nodes
() kubectl get nodes --all-labels

## Imperative vs Declarative
>>Q2: Select all the correct options below that complete correctly the following sentence 'Resources can be managed... <<
[*] ... by executing imperative commands
[] ... by executing declarative commands
[*] ... by declaring it's state using manifests 
[] ... by declaring a set of commands
[] ... by executing imperative manifests

## Labels and selectors
>>Q3: True or false, labels are declared in the metadata section of a resource<<
(*) True
() False

## Taints and tolerations
>>Q4: Select the correct sentence <<
[] Taints are tags that are added to Pods
[] Taints attract a set of pods to be attached to the node
[] Taints are labels that describe a characteristic of a resource
[*] Taints resist a set of pods to be attached to the node

## Node affinity
>>Q5: True or false, node affinity have slightly the same effect of taints <<
() True
(*) False

## Daemon sets
>>Q6: Which are the possible patterns for communicating with Pods in daemonsets? <<
[*] Push
[*] NodeIp
[*] DNS
[*] Service

## Requests and limits
>>Q7: True or false, a container can consume more than what is declared in the Pod request <<
(*) True
() False

>>Q8: True or false, kubelet is in charge of managing resource reservations <<
(*) True
() False