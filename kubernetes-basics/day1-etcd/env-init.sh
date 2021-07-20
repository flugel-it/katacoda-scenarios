#!/bin/sh

launch.sh

# Wait for the worker node to be available
i=1
ready=0
while [ "$ready" -eq 0 ]; do
 ready=`kubectl get nodes | grep node01 | wc -l`
 echo "waiting for worker node ..."
 sleep 10

 # timeout ..
 let "i=i+1"
 if [ "$i" -gt 10 ]; then
   ready=1
 fi
done

{ clear && echo 'Kubernetes is ready.'; } 2> /dev/null
