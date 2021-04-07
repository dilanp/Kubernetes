#IMPERATIVE way of creating a pod.
kubectl run my-nginx --image=nginx:alpine
#Temporarily forward pod's container port too see things externally (without proper services).
kubectl port-forward my-nginx 8080:80

#DECLARATIVE way of creating/updating a pod.
kubectl apply -f pod.yml
#OR create only with added deployment annotations into the metadata section.
kubectl create -f nginx.pod.yml --save-config
#Then check deployment annotations into the metadata section of yml.
kubectl get pod my-nginx -o yaml

#You may also dry run before running it actually...
kubectl create -f nginx.pod.yml --dry-run=client

#Check pod deployment progress.
kubectl get pods --watch

#Get more pod info.
kubectl get pod pod-name -o wide
kubectl get pod pod-name -o yaml
kubectl get pods -o wide

#Get detailed pod info.
kubectl describe pod hello-pod

#See pod label.
kubectl get pods --show-labels

#Jump into the terminal of a container in a pod.
kubectl exec my-nginx -it sh
#If the pod has multiple containers then specify the container name.
kubectl exec pod-name -c container-name -it /bin/sh

#Delete a pod by the manifest file.
kubectl delete -f multi-pod.yml

#Delete a pod by name.
kubectl delete pod hello-pod
