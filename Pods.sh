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

#Jump into the terminal of a container in a pod.
kubectl exec my-nginx -it sh
#If the pod has multiple containers then specify the container name.
kubectl exec pod-name -c container-name -it /bin/sh

#Delete a pod by the manifest file.
kubectl delete -f multi-pod.yml

#Delete a pod by name.
kubectl delete pod hello-pod
