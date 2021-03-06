#IMPERATIVE way of creating a pod.
kubectl run my-nginx --image=nginx:alpine
#Temporarily forward pod's container port too see things externally (without proper services).
kubectl port-forward my-nginx 8080:80

#DECLARATIVE way of creating/updating a pod.
kubectl apply -f pod.yml

#You may also dry run before running it actually...
kubectl create -f nginx.pod.yml --dry-run=client

#Check pod deployment progress.
kubectl get pods --watch

#Get more pod info.
kubectl get pod pod-name -o wide
kubectl get pod pod-name -o yaml
kubectl get pods -o wide

#See pod label.
kubectl get pods --show-labels

#See a description and an audit trail of a pod.
kubectl describe pod pod_name

#Jump into the terminal of a container in a pod.
kubectl exec -it my-nginx -- sh
kubectl exec -it my-first-pod -- /bin/bash
#If the pod has multiple containers then specify the container name.
kubectl exec -it pod-name -c container-name -- sh
kubectl exec -it pod-name -c container-name -- /bin/bash

#Run a command directly inside the pod/container without going into a terminal.
kubectl exec -it my-nginx -- ls-a
kubectl exec -it pod-name -c container-name -- ls-a

#Create a service for a pod.
kubectl expose pod my-first-pod --type=LoadBalancer --port=80 --name=my-first-service

#Delete a pod by the manifest file.
kubectl delete -f multi-pod.yml

#Delete a pod by name.
kubectl delete pod hello-pod

#Checking connectivity between pods...
#Get full name of the pods and pick one.
kubectl get pods
#Get all pods running including K8s internals.
kubectl get pods --all-namespaces
#Note down the IP address of a different pod.
kubectl get pods -o wide
#Enter the shell of the picked pod.
kubectl exec pod/my-nginx-5bb9b897c8-fdwmt -it sh
#Install CURL package there.
apk add curl
#Now try to hit the IP address of the other pod.
curl http://10.1.0.38
#When you have setup a ClusterIp (default) service then, 
#you can use that service name to access any random pod through the service.

#Check logs of a pod.
kubectl logs pod_name
#If the pod has multiple containers.
kubectl logs pod_name -c container_name
#Logs of a previously running pod.
kubectl logs -p pod_name
#Stream logs of a pod.
kubectl logs -f pod_name

#Init container pattern
#======================
# 1 - Init containers run before the appcontainers.
# 2 - Completes before app containers starts.
# 3 - Runs in order sequentially.
# 4 - Pod restarts if one of the init containers fail.
# 5 - Only run idempotent code in init containers.
# 6 - Don't allocate init containers high resource limits or requests.
#-----------------------
# Adapter and Ambassador are also varieties of the Sidecar pattern

