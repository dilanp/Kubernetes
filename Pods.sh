#Push the pod to K8s.
kubectl apply -f pod.yml

#Check pod deployment progress.
kubectl get pods --watch

#Get more pod info.
kubectl get pods -o wide

#Get detailed pod info.
kubectl describe pods hello-pod

#See pod label.
kubectl get pods --show-labels

#Delete a pod by the manifest file.
kubectl delete -f multi-pod.yml

#Delete a pod by name.
kubectl delete pod hello-pod
