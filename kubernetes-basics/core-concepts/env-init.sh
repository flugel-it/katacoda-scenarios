#!/bin/sh

launch.sh

# Helm setup
HELM_VERSION=v3.1.2
curl -fsSL https://get.helm.sh/helm-$HELM_VERSION-linux-amd64.tar.gz | tar -zxvf - -C /usr/local/bin/ linux-amd64/helm --strip=1
helm repo add stable https://kubernetes-charts.storage.googleapis.com/

# Setup dashboard on port 30000
helm install dash stable/kubernetes-dashboard \
--namespace kube-system \
--set=service.type=NodePort \
--set=enableInsecureLogin=true \
--set=service.nodePort=30000 \
--set=service.externalPort=80

source <(kubectl completion bash)
source <(helm completion bash)

# Enable metrics
helm install metrics-server stable/metrics-server --namespace kube-system 

{ clear && echo 'Kubernetes with Helm is ready.'; } 2> /dev/null

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
